class ContactController < ApplicationController
   before_filter :find_categories
  def index
    # render index.html.erb
  end

  def wish_list
    Notifications.deliver_wish_list(params[:email])
    flash[:notice] = "Email was succesfully sent."
    redirect_to :action => "index"
  end
  
  def send_mail
    Notifications.deliver_contact_form(params[:email])
    flash[:notice] = "Email was succesfully sent."
    redirect_to :action => "index"
  end
end