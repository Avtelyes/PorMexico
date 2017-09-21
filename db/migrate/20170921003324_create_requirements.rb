class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
      t.string :name
      t.timestamps
    end
  end


  create_join_table :posts, :requirements

end
