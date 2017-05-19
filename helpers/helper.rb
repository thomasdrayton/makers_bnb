def send_mail(mail_subject, mail_body)
  mail = Mail.new do
    from    'DreamTeam@makersbnb.co.uk'
    to      'jaiye.s@gmail.com'
    subject mail_subject
    body    mail_body
  end
  mail.delivery_method :sendmail
  mail.deliver
end

def current_user
  @current_user ||= User.get(session[:user_id])
end

def redirect_if_not_signed_in
  redirect '/' unless session[:user_id]
end
