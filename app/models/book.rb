class Book < ApplicationRecord

  def self.search(keyword)
    if keyword == ''
      books = Book.all
    else
      books = Book.where(['title LIKE(?) OR body LIKE(?)', "%#{keyword}%", "%#{keyword}%"])
    end
  end
end
