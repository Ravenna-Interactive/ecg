class Brand < ActiveRecord::Base
  has_many :products
  belongs_to :category
  
  has_attached_file :photo,
    :styles => {
      :thumb => "75x75>",
      :original => "213x163#"},
      
      :url => "/system/brands/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/brands/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
end
