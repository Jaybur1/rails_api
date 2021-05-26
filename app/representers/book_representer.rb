class BookRepresenter
  def initialize(book)
    @book = book
  end
  def as_json
      {
        id: @book.id,
        title: @book.title,
        author_name: author_name(@book),
        author_age: @book.author.age,
        author_initials: author_initials(@book)
      }
  end
  private
  attr_reader :books

  def author_name book; "#{book.author.first_name} #{book.author.last_name}"; end
  def author_initials book; "#{book.author.first_name[0].upcase}.#{book.author.last_name[0].upcase}"; end

end