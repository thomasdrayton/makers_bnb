require 'twilio-ruby'

class Request
  include DataMapper::Resource

  belongs_to :space
  belongs_to :user

  property :id, Serial
  property :startDateReq, Date
  property :endDateReq, Date
  property :confirmed, Boolean


  def text_owner_of(space, request)

    phone_number = '+447788238989'

    account_sid = "AC81484a848edc0fb0b146b2a41ed43093"
    auth_token = "51bd7ca12a212a5658242c268223756d"

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.sms.messages.create(
    :from => "+441740582048",
    :to => phone_number,
    :body => "Hi #{space.user.name} You have a new request for #{space.name}! from #{request.user.name} Please log in to see the details.")
  end

end
