class ChangeReferencesPostLocation < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :locations, :posts
    remove_reference :locations, :post, index: true

    add_reference :posts, :location, index: true
    add_foreign_key :posts, :locations
  end
end
