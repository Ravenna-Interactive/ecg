class Visitor < ActiveRecord::Base

  has_attached_file :photo,
    :styles => {
      :thickbox => "400x400>",
      :visitor => "150x150>", # Image to be the Visitor Potfolio
      :original => "258x198#" }, # Image to fit the homepage recents 258px x 198px
      :big => "1000x1000>",
      
      :url => "/system/visitors/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/visitors/:id/:basename_:style.:extension"

   
    validates_attachment_content_type :photo, 
    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']

end
