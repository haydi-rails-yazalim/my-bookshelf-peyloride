class BookList < ApplicationRecord
  has_many :users_books
  has_many :users, through: :users_books
end
