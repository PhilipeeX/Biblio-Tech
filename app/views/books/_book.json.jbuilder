json.extract! book, :id, :author_id, :title, :isbn, :description, :publish_year, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
