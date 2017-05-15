#require 'dm-migrations'
#require 'data_mapper'
#require 'dm-postgres-adapter'

#DataMapper::Logger.new($stdout, :debug)
#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test_2")

class User

  include DataMapper::Resource

property :id, Serial
property :title, String

end

#DataMapper.finalize
#DataMapper.auto_upgrade!
