class CreateUsersBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_books do |t|
      t.integer :user_id
      t.integer :book_list_id

      t.timestamps
    end
  end
end
