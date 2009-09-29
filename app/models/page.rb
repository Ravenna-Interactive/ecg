class Page < ActiveRecord::Base
  before_save :downcase_fields
  acts_as_textiled :body
  
  def downcase_fields
    self.title.downcase! unless self.title.nil?
    self.name.downcase! unless self.name.nil?
  end
end
