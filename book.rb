class Book
  attr_accessor :title, :author

  def initialize(title, _author)
    @title = title
    @author = author private
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
