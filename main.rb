require_relative('./app')

def create_person
  print 'Do you want to create a stduent (1) or a teacher (2)? [Input the number]: '
  choice = gets.chomp
  if choice == '1'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    app.create_student(age, name, permission)
    puts 'Person created successfully'
  elsif choice == '2'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    app.create_teacher(age, name, specialization)
    puts 'Person created successfully'
  else
    puts 'Invalid choice'
  end
end    

def show_options
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def create_rentals
  puts 'Select a book from the following list by number'
  app.list_all_books(select = true)
  book_idx = gets.chomp.to_i
  puts "\nSelect a person from the following list by number (not id)"
  app.list_all_people(select = true)
  person_idx = gets.chomp.to_i
  print "\nDate: "
  date = gets.chomp
  app.create_rental(book_idx, person_idx, date)
  puts 'Rental created successfully'
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def main
  app = App.new
  exit = false
  puts "Welcome to School Library App! \n\n"

  until exit
    show_options
    option = gets.chomp
    case option
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rentals
    when '6'
      print 'ID of person: '
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when '7'
      puts 'Thank you for using this app!'
      exit = true
    end

  end
end

main
