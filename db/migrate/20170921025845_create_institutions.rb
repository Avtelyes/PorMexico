class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :title
      t.string :description
      t.string :type
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
