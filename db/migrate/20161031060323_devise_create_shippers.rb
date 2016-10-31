class DeviseCreateShippers < ActiveRecord::Migration[5.0]
  def change
    create_table :shippers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string :company_name,    null: false, default: ""
      t.string :street_address,  null: false, default: ""
      t.string :sub_district,    default: ""
      t.string :district,        default: ""
      t.string :province,        null: false, default: ""
      t.string :country,         null: false, default: "Thailand"
      t.string :postal_code,     null: false, default: ""
      t.integer :office_phone,   null: false, default: 0
      t.string :contact_person,  null: false, default: ""
      t.integer :tax_id,         null: false, default: 0

      t.timestamps null: false
    end

    add_index :shippers, :email,                unique: true
    add_index :shippers, :reset_password_token, unique: true
    # add_index :shippers, :confirmation_token,   unique: true
    # add_index :shippers, :unlock_token,         unique: true
  end
end
