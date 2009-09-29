class Staff < ActiveRecord::Base
  
  has_attached_file :photo,
    :styles => {
      :thumb => "150x150>", 
      :original => "400x400>" },
     
      
      :url => "/system/staff/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/staff/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
    
    
    #Validations
    validates_presence_of :name, :message => "You must enter a name!"
end
