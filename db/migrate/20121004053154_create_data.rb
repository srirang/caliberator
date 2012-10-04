class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.text :name
      t.text :uncompressed_size
      t.text :format
      t.integer :book

      t.timestamps
    end
  end
end
