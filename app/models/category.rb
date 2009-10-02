class Category < ActiveRecord::Base
  has_many :brands, :through => :products, :uniq => true
  has_many :products
 # acts_as_friendly_param :name
 
 validates_presence_of :url_name
 validates_uniqueness_of :url_name
 
 def to_param
  self.url_name
 end
end
