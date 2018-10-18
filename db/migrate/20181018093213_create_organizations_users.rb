Sequel.migration do
  change do
    create_table :organizations_users do
      foreign_key :user_id, :users
      foreign_key :organization_id, :organizations

      primary_key [:user_id, :organization_id]
      index [:user_id, :organization_id]
    end
  end
end
