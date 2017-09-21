class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :location
      t.string :category
      t.string :status
      t.string :phone
      t.string :priority
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
