class Image

  include DataMapper::Resource

  belongs_to :space

  property :id, Serial
  property :image_url, Text

end
