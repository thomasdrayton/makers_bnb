#ADDED

class Tag

  include DataMapper::Resource

  property :id, Serial
  property :pool,Boolean, :default  => false
  property :terrace,Boolean, :default  => false
  property :studio,Boolean, :default  => false
  property :wifi,Boolean, :default  => false
  property :AC,Boolean, :default  => false
  property :appartment,Boolean, :default  => false
  property :close_to_beach,Boolean, :default  => false
  property :balcony,Boolean, :default  => false
  
  belongs_to :space #have a 1 to many relationship - 1 space 1 tag, 1 tag many spaces



end
