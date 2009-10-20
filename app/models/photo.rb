class Photo < ActiveRecord::Base
  belongs_to :product
  after_save :set_only_front, :if => :front?

    has_attached_file :data,
    
    :url => "/system/products/:product_id/:basename_:style.:extension",
    :path => ":rails_root/public/system/products/:product_id/:basename_:style.:extension",
    :styles => {
      :tiny => "50x50>",
      :catalog => "140x107#",
      :original => "700x700>",
      :spotlight => "236x216#",
    }

    ##validates_attachment_presence :data
    validates_attachment_content_type :data, 
    :content_type => ['image/jpeg', 'image/pjpeg', 
                                     'image/jpg', 'image/png']

  Paperclip::Attachment.interpolations[:product_id] = proc do |attachment, style|
    attachment.instance.product.id
  end

  def self.destroy_pics(product, photos)
    Photo.find(photos, :conditions => {:product_id => product}).each(&:destroy)
  end


  private
  
    # Ensures that it is the only photo with front set to true when being saved
    # after front is set to true.
    def set_only_front
      self.product.photos.update_all("front = #{self.connection.quoted_false}", (!self.new_record? ? ["id != ?", self.id] : nil)) unless self.product.nil?
    end
 #
  
end