class ContactController < ApplicationController
   before_filter :find_categories
  def index
    # render index.html.erb
    @page = Page.find_by_name('contact')
  end

  def send_mail
    Notifications.deliver_contact_form(params[:email])
    flash[:notice] = "Email was succesfully sent."
    redirect_to :action => "index"
  end
end