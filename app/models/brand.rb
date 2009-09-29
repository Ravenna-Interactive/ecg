class Brand < ActiveRecord::Base
  has_many :products
  belongs_to :category
  #acts_as_friendly_param :name
  
  #Validations
  validates_presence_of :name
end
