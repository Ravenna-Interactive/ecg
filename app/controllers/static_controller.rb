class StaticController < ApplicationController
   before_filter :find_categories
  
  def home
    @visitors = Visitor.find(:all, :order => "Random()", :limit => 1)
    @categories = Category.all
    
    @new_spotlight = Product.new_spotlight
    @vintage_spotlight = Product.vintage_spotlight
    
  end
  def history
    @page = Page.find_by_name('history')
  end
  
  def shop_info
    @page = Page.find_by_name('shop_info')
  end
  
  def about
    @page = Page.find_by_name('about')
  end
  
  def find_banner
    @banner = Banner.find(:first)
    render :layout => false
  end
  
  def admin
    @pages = Page.all
    @banners = Banner.all
    @staffs = Staff.all
  end
  
end
