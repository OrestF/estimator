Sequel.migration do
  change do
    alter_table :marks do
      add_foreign_key :report_id, :reports
      
      add_index :report_id
    end
  end
end
