require 'bcrypt'
require './data_mapper_setup'
require_relative 'Space'


class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :password_encrypt, Text
  validates_format_of :email, as: :email_address
  has n, :spaces

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_encrypt) == password
      user
    else
      nil
    end
  end
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
