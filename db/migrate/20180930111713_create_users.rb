Sequel.migration do
  up do
    create_table :users do |t|
      primary_key :id

      String :email, size: 255, null: false, unique: true
      String :encrypted_password, size: 255, null: false, default: ''
      String :reset_password_token
      DateTime :reset_password_sent_at
      DateTime :remember_created_at

      Integer  :sign_in_count, default: 0, null: false
      DateTime :current_sign_in_at
      DateTime :last_sign_in_at
      String   :current_sign_in_ip
      String   :last_sign_in_ip

      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false

      index [:id, :email]
    end
  end

  down do
    drop_table :users
  end
end
