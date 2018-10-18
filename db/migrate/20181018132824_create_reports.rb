Sequel.migration do
  change do
    create_table :reports do
      primary_key :id

      Integer :technology, null: false
      Integer :status, default: 0

      foreign_key :user_id, :users, null: false
      foreign_key :project_id, :projects, null: false

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id]
    end
  end
end
