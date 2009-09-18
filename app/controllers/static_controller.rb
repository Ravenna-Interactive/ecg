class StaticController < ApplicationController
   before_filter :find_categories
  
  def home
    @visitors = Visitor.find(:all, :order => "random()", :limit => 1)
    @categories = Category.all
    
  end
  def links
    
  end
  
  def about
    
  end
  
  def find_banner
    @banner = Banner.find(:first)
    render :layout => false
  end
  
end
