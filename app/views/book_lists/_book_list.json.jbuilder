json.extract! book_list, :id, :name, :description, :year, :author, :publisher, :number_of_pages, :created_at, :updated_at
json.url book_list_url(book_list, format: :json)