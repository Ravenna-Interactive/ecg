class WishListController < ApplicationController
   before_filter :find_categories
  def index
    @page = Page.find_by_name('wish_list')
     # render index.html.erb
   end

   def wish_list
     Notifications.deliver_wish_list(params[:email])
     flash[:notice] = "Email was succesfully sent."
     redirect_to :controller => "static", :action => "home"
   end
end
