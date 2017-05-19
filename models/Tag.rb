# ADDED

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :spaces, through: Resource
end
