class Category < ActiveRecord::Base
  has_many :brands, :through => :products
  has_many :products
 # acts_as_friendly_param :name
end
