# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  include AuthenticatedSystem
   
   before_filter :meta_defaults
   private

  def meta_defaults
     @meta_title = ""
     @meta_keywords = "Vintage Guitars, Seattle Vintage Guitars, Guitars, Used Guitars, Seattle Used Guitars"
     @meta_description = "Seattle's Best Vintage and Used Guitar Shop"
   end
   
  protected 
    def find_categories
      @categories = Category.find(:all)
    end
    
    
   

  
end
