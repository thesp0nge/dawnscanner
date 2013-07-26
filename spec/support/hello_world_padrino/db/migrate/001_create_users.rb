migration 1, :create_users do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :login, DataMapper::Property::String, :length => 255
      column :password, DataMapper::Property::String, :length => 255
      column :name, DataMapper::Property::String, :length => 255
      column :created_at, DataMapper::Property::DateTime
      column :updated_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :users
  end
end
