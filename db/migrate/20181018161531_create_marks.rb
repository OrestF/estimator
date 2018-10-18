Sequel.migration do
  change do
    create_table :marks do
      primary_key :id

      Float :optimistic, null: false
      Float :pessimistic

      foreign_key :task_id, :tasks, null: false
      foreign_key :user_id, :users, null: false

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id]
    end
  end
end
