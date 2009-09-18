class Category < ActiveRecord::Base
  has_many :brands, :through => :products
  has_many :products
end
