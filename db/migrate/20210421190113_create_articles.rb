class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :wikipedia_id

      t.timestamps
    end
    add_index :articles, :wikipedia_id, unique: true
  end
end
