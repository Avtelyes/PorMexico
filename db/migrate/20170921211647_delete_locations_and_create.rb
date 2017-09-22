class DeleteLocationsAndCreate < ActiveRecord::Migration[5.0]
  def change
    drop_table :locations

    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :state
      t.references :post, index: true, foreign_key: true

      t.timestamps
    end
  end
end
