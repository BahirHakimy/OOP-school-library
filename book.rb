require_relative('./rental')
class Book
  attr_accessor :title, :author

  def initialize(title, _author)
    @title = title
    @author = author private
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end
end
