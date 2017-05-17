require 'bcrypt'
require 'data_mapper'
class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  has n, :spaces, :required => false
  has n, :requests, :required => false

  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :password_encrypt, Text
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_encrypt) == password
  end
end
