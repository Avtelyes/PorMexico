class CreateUsersPostJointable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :posts, :users, options = {:table_name => "helping_users"}
  end
end
