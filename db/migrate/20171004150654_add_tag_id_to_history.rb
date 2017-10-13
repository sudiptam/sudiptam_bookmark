class AddTagIdToHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :tag_id, :integer
  end
end
