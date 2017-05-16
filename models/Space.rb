class Space

  include DataMapper::Resource

  belongs_to :user
  has n, :requests, :required => false

  property :id, Serial, :key => true
  property :name, String
  property :city, String
  property :street, String
  property :postcode, String
  property :price, Float
  property :description, Text
  property :startDate, Date
  property :endDate, Date
  property :user_id, Integer
end
