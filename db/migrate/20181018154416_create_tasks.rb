Sequel.migration do
  change do
    create_table :tasks do
      primary_key :id

      String :title, size: 255, null: false
      Integer :technology, null: false

      foreign_key :user_id, :users, null: false

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id]
    end
  end
end
