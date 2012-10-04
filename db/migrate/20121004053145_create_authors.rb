class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :name
      t.text :link
      t.text :sort

      t.timestamps
    end
  end
end
