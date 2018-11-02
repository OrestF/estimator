Sequel.migration do
  change do
    create_table(:organizations) do
      primary_key :id
      column :name, "character varying(255)", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:id]
      index [:name], :name=>:organizations_name_key, :unique=>true
    end
    
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
    
    create_table(:organizations_users) do
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      foreign_key :organization_id, :organizations, :null=>false, :key=>[:id]
      
      primary_key [:user_id, :organization_id]
      
      index [:user_id, :organization_id]
    end
    
    create_table(:projects) do
      primary_key :id
      column :name, "character varying(255)", :null=>false
      column :description, "text"
      foreign_key :organization_id, :organizations, :null=>false, :key=>[:id]
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:id]
    end
    
    create_table(:tasks) do
      primary_key :id
      column :title, "character varying(255)", :null=>false
      column :technology, "integer", :null=>false
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:id]
    end
    
    create_table(:marks) do
      primary_key :id
      column :optimistic, "double precision", :null=>false
      column :pessimistic, "double precision"
      foreign_key :task_id, :tasks, :null=>false, :key=>[:id]
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:id]
    end
    
    create_table(:projects_users) do
      foreign_key :project_id, :projects, :null=>false, :key=>[:id]
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      
      primary_key [:project_id, :user_id]
      
      index [:user_id, :project_id]
    end
    
    create_table(:reports) do
      primary_key :id
      column :technology, "integer", :null=>false
      column :status, "integer", :default=>0
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      foreign_key :project_id, :projects, :null=>false, :key=>[:id]
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:id]
    end
    
    create_table(:reports_tasks) do
      foreign_key :report_id, :reports, :null=>false, :key=>[:id]
      foreign_key :task_id, :tasks, :null=>false, :key=>[:id]
      
      primary_key [:report_id, :task_id]
      
      index [:task_id, :report_id]
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20180930111713_create_users.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018063543_create_organization.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018093213_create_organizations_users.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018115923_create_projects.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018132824_create_reports.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018154416_create_tasks.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018160136_create_tasks_reports.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181018161531_create_marks.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181102150041_create_projects_users.rb')"
                end
              end
