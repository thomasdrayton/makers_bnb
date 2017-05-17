require 'twilio-ruby'

class Request
  include DataMapper::Resource

  belongs_to :space
  belongs_to :user

  property :id, Serial
  property :startDateReq, Date
  property :endDateReq, Date
  property :confirmed, Boolean


  def text_owner_of(space)

    phone_number = space.user.phone.to_s

    account_sid = 'AC11dceb37b4a74ea57004ab32ab0b2837'
    auth_token = '5c76ce6035906d17b3440a00d58d5c4e'

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.sms.messages.create(
    :from => '+441290211655',
    :to => phone_number,
    :body => "You have a new request for #{space.name}! Please log in to see the details."
  end

end
