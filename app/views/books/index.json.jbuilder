json.array! @books do |book|
  json.title book.title
  json.body book.body
end