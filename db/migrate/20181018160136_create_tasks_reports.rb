Sequel.migration do
  change do
    create_join_table(task_id: :tasks, report_id: :reports)
  end
end
