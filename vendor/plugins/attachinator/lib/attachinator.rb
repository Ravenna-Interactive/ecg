module Attachinator
  
  module FormBuilderExtensions
    
    # Works like <tt>fields_for</tt> but creates a javascript control that allows for adding
    # additional <tt>file_field</tt> elements.
    # 
    # Basic usage example on an <tt>Album</tt> model that <tt>has_many :photos</tt> and a <tt>Photo</tt>
    # model that uses Paperclip to store uploaded file data in a <tt>file</tt> property
    # <tt>has_attached_file :photo</tt>:
    # 
    #   <%- form_for @album, :html => {:multipart => true} do |form| -%>
    #     <%= form.attachment_fields_for :photos, :file %>
    #   <%- end -%>
    # 
    # This will create an input field for every associated <tt>Photo</tt> model as well as a javascript
    # control that allows the user to add more file upload fields.
    # 
    # If your require more than an upload field you can supply a block like so:
    # 
    #   <%- form_for @album, :html => {:multipart => true} do |form| -%>
    #     <%- form.attachment_fields_for :photos, :html => {:multipart => true} do |attachment_fields| -%>
    #       <%= attachment_fields.label :name %>
    #       <%= attachment_fields.text_field :name %>
    #       <%= attachment_fields.file_field :file %>
    #     <%- end -%>
    #   <%- end -%>
    # 
    # All of the DOM nodes inside of the block will be cloned and properties updated accordingly (<tt>id</tt>,
    # <tt>name</tt>, and <tt>for</tt> attributes specifically).
    # 
    # Arguments:
    # * <tt>association</tt> - Symbol - the model's has_many association that will be receiving file uploads
    # * <tt>method</tt> - Symbol - the name of the method on the associated object that receives the file
    #   upload data
    # * <tt>options</tt> - Optional: Hash - see below for options
    # * <tt>field_for_options</tt> - Optional: Hash - passes this Hash as options for +fields_for+
    # 
    # Options:
    # 
    # * <tt>:include_add_new_field</tt> - Optional Include a link that adds a new set of fields via javascript -
    #   defaults to 'New #{method}'
    # * <tt>:new_objects</tt> - Optional number of new objects to build for the association, defaults to 1
    # * <tt>:wrapper_class</tt> - Optional class name to use for the div that will wrap each object's fields
    # * <tt>:js_lib</tt> - Optional javascript library to use. Defaults to <tt>:prototype</tt> but also supports
    #   <tt>:jquery</tt> no other libraries currently supported
    
    def attachment_fields_for(association, method = nil, options = {}, form_for_options = {}, &block)
      
      raise ArgumentError, 'Second argument required when calling without block' if method.nil? && !block_given?
      
      index_name = @object_name + "[#{association}_attributes]"
      name_pattern = "(name=\"" + @object_name + "\\\[#{association}_attributes\\\]\\\[)[\\\d]+(\\\][^\"]+)"
      id_pattern = "(id=\"" + @object_name + "_#{association}_attributes_)[\\\d]+([^\"]+)"
      for_pattern = "(for=\"" + @object_name + "_#{association}_attributes_)[\\\d]+([^\"]+)"
  
      options = {
        :include_add_new_field => "Add #{association.to_s.singularize}",
        :new_objects => 1,
        :wrapper_class => @object_name + "_#{association}_attributes_fields",
        :js_lib => :prototype
      }.merge(options)

      options[:new_objects].times { object.send(association).send(:build) }
            
      fields = fields_for(association, form_for_options) do |builder|
        @template.content_tag :div, :class => options[:wrapper_class] do
          builder.file_field method
        end
      end unless block_given?
            
      fields = fields_for(association, form_for_options) do |builder|
        @template.content_tag :div, :class => options[:wrapper_class] do
          block.call(builder)
        end
      end if block_given?
      
      
      # The magical javascript. Puts a new link that fires some javascript that copies that last element
      # but makes sure all of the names, ids, and fors are correctly mapped up
      
      fields << @template.link_to(options[:include_add_new_field], '#', :id => "add_#{options[:wrapper_class]}") << @template.javascript_tag do
        if options[:js_lib] == :prototype
          <<-eof
        
          $('add_#{options[:wrapper_class]}').observe('click', function(e){
            Event.stop(e);
            var $fs = $$(".#{options[:wrapper_class]}");
            var $fg = $fs.last();
            var $template = $fg.innerHTML;
            $template = $template.replace(/#{name_pattern}/gi, "$1"+$fs.length+"$2");
            $template = $template.replace(/#{id_pattern}/gi, "$1"+$fs.length+"$2");
            $template = $template.replace(/#{for_pattern}/gi, "$1"+$fs.length+"$2");
            new Insertion.After($fg, "<div class=\\"#{options[:wrapper_class]}\\">"+$template+"</div>");
          });
        
          eof
        elsif options[:js_lib] == :jquery
          <<-eof
        
          $('#add_#{options[:wrapper_class]}').click(function(e){
            e.preventDefault();
            var $fs = $(".#{options[:wrapper_class]}");
            var $fg = $(".#{options[:wrapper_class]}:last");
            var $template = $fg.html();
            $template = $template.replace(/#{name_pattern}/gi, "$1"+$fs.length+"$2");
            $template = $template.replace(/#{id_pattern}/gi, "$1"+$fs.length+"$2");
            $template = $template.replace(/#{for_pattern}/gi, "$1"+$fs.length+"$2");
            $fg.after("<div class=\\"#{options[:wrapper_class]}\\">"+$template+"</div>");
          });
        
          eof
        else
          raise ArgumentError, ":javascript option set to unssuported library #{options[:js_lib]}"
          
        end
      end if options[:include_add_new_field]
      
      @template.concat(fields) if block_given?
      fields

      
    end
        
  end
    
end

