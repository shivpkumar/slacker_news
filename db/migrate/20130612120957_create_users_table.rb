class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password_hash, :first_name, :last_name, :email
    end
  end
end
