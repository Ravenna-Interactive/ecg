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
   
   def mobile_device?
     if session[:mobile_param]
       session[:mobile_param] == "1"
     else
       request.user_agent =~ /Mobile|webOS/
     end
   end
   helper_method :mobile_device?

   def prepare_for_mobile
     session[:mobile_param] = params[:mobile] if params[:mobile]
     request.format = :mobile if mobile_device?
   end
   
   def redirect_mobile 
       redirect_to '/mobile.html' if mobile_device?
   end
   
    
   protected 
    def find_categories
      @categories = Category.find(:all)
    end
    
    
   

  
end
