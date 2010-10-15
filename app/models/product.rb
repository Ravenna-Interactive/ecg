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


  
  def self.per_page
      12
  end
  
  def self.new_spotlight=(a_product)
    spotlight = Spotlight.find_by_name("New")
    spotlight.product = a_product
    spotlight.save
  end
  def self.vintage_spotlight=(a_product)
    spotlight = Spotlight.find_by_name("Vintage")
    spotlight.product = a_product
    spotlight.save
  end
  
  def self.find_new_spotlight
     spotlight = Spotlight.find_by_name("New")
     spotlight.product
  end
  def self.find_vintage_spotlight
     spotlight = Spotlight.find_by_name("Vintage")
     spotlight.product
  end
  
  
end
