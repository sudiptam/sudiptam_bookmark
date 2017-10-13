class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :url
      t.string :title
      t.boolean :favorites
      t.boolean :archive

      t.timestamps
    end
  end
end
