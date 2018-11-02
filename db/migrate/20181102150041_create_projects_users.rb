Sequel.migration do
  change do
    create_join_table(project_id: :projects, user_id: :users)
  end
end
