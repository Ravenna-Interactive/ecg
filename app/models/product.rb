class Product < ActiveRecord::Base
  #Relationships
  belongs_to :category
  belongs_to :brand
  has_one :spotlight
  
  acts_as_friendly_param :title
  
  has_many :photos
  has_one :front_photo, :class_name => 'Photo', :conditions => {:front => true}, :autosave => true

  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes["data"].blank? }

  has_attached_file :audioclip,      
      :url => "/system/product_audio/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/product_audio/:id/:basename_:style.:extension"

   
      #validates_attachment_presence :audioclip
      #validates_attachment_content_type :audioclip, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
      #validates_attachment_size :audioclip, :less_than => 20.megabytes


  
  def self.per_page
      6
  end
  
  def self.new_spotlight=(a_product)
    spotlight = Spotlight.find_first_by_name("new")
    spotlight.product = a_product
    spotlight.save
  end
  def self.vintage_spotlight=(a_product)
    spotlight = Spotlight.find_first_by_name("vintage")
    spotlight.product = a_product
    spotlight.save
  end
  
end
