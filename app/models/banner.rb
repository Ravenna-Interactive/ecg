class Banner < ActiveRecord::Base
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100>", 
      :original => "400x400#" },
     
      
      :url => "/system/banners/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/banners/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
    
    
    before_validation :clear_photo

    def delete_photo=(value)
      @delete_photo = !value.to_i.zero?
    end

    def delete_photo
      !!@delete_photo
    end
    alias_method :delete_photo?, :delete_photo

    def clear_photo
      self.photo = nil if delete_photo?
    end
    
end
