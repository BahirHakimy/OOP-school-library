def main
  database = {
    books: [],
    people: [],
    rentals: []
  }

  puts "Welcome to School Library App! \n\n"


  while true
    puts "
    Please choose an option by enterin a number:\n
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    "
    input = gets.chomp
    case input
    when 1
      database.book.each do |book| 
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    # when 2
    #   database.people.each do |person| 
    #     puts "[#{person.is_a?(Teacher) ? "Teacher" : "Student"}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    #   end


  end
end

main