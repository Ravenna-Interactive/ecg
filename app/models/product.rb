class Product < ActiveRecord::Base
  #Relationships
  belongs_to :category
  belongs_to :brand
  
  
  acts_as_friendly_param :title
  
  has_many :photos
  has_one :front_photo, :class_name => 'Photo', :conditions => {:front => true}, :autosave => true

  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes["data"].blank? }

  has_attached_file :audioclip,      
      :url => "/system/product_audio/:id/:basename_:style.:extension",
      :path => ":rails_root/public/system/product_audio/:id/:basename_:style.:extension"

   
      validates_attachment_presence :audioclip
      validates_attachment_content_type :audioclip, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
      validates_attachment_size :audioclip, :less_than => 20.megabytes
  
  def self.per_page
      6
  end
  
  def self.new_spotlight
    Spotlight.find_first_by_name("new").product
      (Spotlight.find_first_by_name("new").product = a_product).save
  end

  def self.vintage_spotlight
    Spotlight.find_first_by_name("vintage").product
      (Spotlight.find_first_by_name("vintage").product = a_product).save
  end
  
end
