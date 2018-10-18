Sequel.migration do
  up do
    create_table :organizations do
      primary_key :id

      String :name, size: 255, null: false, unique: true

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id]
    end
  end

  down do
    drop_table :organizations
  end
end
