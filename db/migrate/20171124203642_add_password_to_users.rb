class AddPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :encrypted_password, :string, null: false
    add_column :users, :password_salt, :string, null: false
  end
end
