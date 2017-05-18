require "uk_postcode"
require 'date'
class Space

  include DataMapper::Resource

  belongs_to :user
  has n, :requests
  has n, :images
  has n, :tags, :through => Resource

  property :id, Serial
  property :name, String
  property :city, String
  property :street, String
  property :postcode, String
  property :price, Float
  property :description, Text
  property :startDate, Date
  property :endDate, Date

  def self.validate_postcode(postcode)
    pc = UKPostcode.parse(postcode)
    postcode if pc.valid?
  end

  def self.validate_date(date1, date2)
    date = false
    date = true if date1 < date2
  end

end
