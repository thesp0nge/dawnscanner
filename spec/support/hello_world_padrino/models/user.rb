class User
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :login, String
  property :password, String
  property :name, String
  property :created_at, DateTime
  property :updated_at, DateTime
end
