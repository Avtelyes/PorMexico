class RenameTypeToTypeHelp < ActiveRecord::Migration[5.0]
  def change
    rename_column :institutions, :type, :help_type
  end
end
