require './data_mapper_setup'
require_relative 'User'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :city, String
  property :street, String
  property :postcode, String
  property :price, Float
  property :description, Text
  # property :tags, String
  property :startDate, Date
  property :endDate, Date
  #Keep in mind possibility of extracting DateTime to seperate model at later date
  # belongs_to, :user
end
