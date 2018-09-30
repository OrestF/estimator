Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id
      column :email, "character varying(255)", :null=>false
      column :encrypted_password, "character varying(255)", :default=>"", :null=>false
      column :reset_password_token, "text"
      column :reset_password_sent_at, "timestamp without time zone"
      column :remember_created_at, "timestamp without time zone"
      column :sign_in_count, "integer", :default=>0, :null=>false
      column :current_sign_in_at, "timestamp without time zone"
      column :last_sign_in_at, "timestamp without time zone"
      column :current_sign_in_ip, "text"
      column :last_sign_in_ip, "text"
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:email], :name=>:users_email_key, :unique=>true
      index [:id, :email]
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20180930111713_create_users.rb')"
  end
end
