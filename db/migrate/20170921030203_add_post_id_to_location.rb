class AddPostIdToLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, index: true, foreign_key: true
  end
end
