class StaticController < ApplicationController
   before_filter :find_categories
  
  def home
    @banner = Banner.first
    @visitors = Visitor.find(:all, :order => ActiveRecord::Base.connection.random_function, :limit => 1)
    @categories = Category.all
    @new_spotlight = Product.find_new_spotlight
    @vintage_spotlight = Product.find_vintage_spotlight
    @meta_title = "Home"
    
  end
  def history
    @page = Page.find_by_name('history')
    @meta_title = "Shop #{@page.name}"
  end
  
  def shop_info
    @page = Page.find_by_name('shop_info')
    @meta_title = "Shop Info"
  end
  
  def about
    @page = Page.find_by_name('about')
    @meta_title = "About the Shop"
  end
  
  def repairs
     @page = Page.find_by_name('repairs')
     @meta_title = "Repairs"
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
