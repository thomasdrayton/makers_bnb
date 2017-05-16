require 'data_mapper'

class Request

  include DataMapper::Resource

  belongs_to :space
  belongs_to :user

  property :id, Serial
  property :startDateReq, Date
  property :endDateReq, Date
  property :confirmed, Boolean

end
