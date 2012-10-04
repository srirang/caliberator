class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :sort
      t.timestamp :timestamp
      t.timestamp :pubdate
      t.decimal :series_index
      t.string :author_sort
      t.string :isbn
      t.string :lccn
      t.string :path
      t.integer :flags
      t.string :uuid
      t.boolean :has_cover
      t.timestamp :last_modified

      t.timestamps
    end
  end
end
