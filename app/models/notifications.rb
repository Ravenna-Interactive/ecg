class Notifications < ActionMailer::Base
    
    def wish_list(email_params, sent_at = Time.now)
      subject "[Wish List] " #<< email_params[:subject]
      recipients "jayboone@emeraldcityguitars.com" # Perhaps your address here?
      from email_params[:address]
      sent_on sent_at

      # allows access to @message and @sender_name
      # in the view
      body :message => email_params[:body], 
           :sender_name => email_params[:name],
           :product => email_params[:product],
           :phone => email_params[:phone],
           :home => email_params[:home]
        
    end
    
     def contact_form(email_params, sent_at = Time.now)
        subject "[Contact Form] " #<< email_params[:subject]
        recipients "jayboone@emeraldcityguitars.com" # Perhaps your address here?
        from email_params[:address]
        sent_on sent_at

        # allows access to @message and @sender_name
        # in the view
        body :message => email_params[:body], 
             :sender_name => email_params[:name],
             :comment => email_params[:comment],
             :phone => email_params[:phone],
             :home => email_params[:home]

      end
  end


