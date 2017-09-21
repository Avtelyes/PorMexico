class AddEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :fb_profile, :string
    add_column :users, :location, :string
  end
end
