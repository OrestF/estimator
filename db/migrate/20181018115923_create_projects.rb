Sequel.migration do
  change do
    create_table :projects do
      primary_key :id

      String :name, size: 255, null: false
      String :description

      foreign_key :organization_id, :organizations, null: false

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id]
    end
  end
end
