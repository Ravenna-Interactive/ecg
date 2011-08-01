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
   
     MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

      def detect_browser
        layout = selected_layout
        return layout if layout
        agent = request.headers["HTTP_USER_AGENT"].downcase
        MOBILE_BROWSERS.each do |m|
          return "mobile_application" if agent.match(m)
        end
        return "application"
      end

      def selected_layout
        session.inspect # force session load
        if session.has_key? "layout"
          return (session["layout"] == "mobile") ? 
            "mobile_application" : "application"
        end
        return nil
      end
  protected 
    def find_categories
      @categories = Category.find(:all)
    end
    
    
   

  
end
