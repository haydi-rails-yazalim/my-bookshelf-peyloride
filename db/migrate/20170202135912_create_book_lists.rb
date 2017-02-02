class CreateBookLists < ActiveRecord::Migration[5.0]
  def change
    create_table :book_lists do |t|
      t.string :name
      t.string :description
      t.integer :year
      t.string :author
      t.string :publisher
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
