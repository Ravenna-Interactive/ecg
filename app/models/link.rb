class Link < ActiveRecord::Base
  has_attached_file :photo,
    :styles => {

      :original => "100x100>" },
     
      
      :url => "/system/visitors/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/visitors/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
end
