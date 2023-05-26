require_relative('./app')

def create_student(app)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  permission = gets.chomp.downcase == 'y'
  app.create_student(age, name, permission)
  puts 'Person created successfully'
end

def create_teacher(app)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  app.create_teacher(age, name, specialization)
  puts 'Person created successfully'
end

def create_person(app)
  print 'Do you want to create a stduent (1) or a teacher (2)? [Input the number]: '
  choice = gets.chomp
  if choice == '1'
    create_student(app)
  elsif choice == '2'
    create_teacher(app)
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

def create_rentals(app)
  puts 'Select a book from the following list by number'
  app.list_all_books(true)
  book_idx = gets.chomp.to_i
  puts "\nSelect a person from the following list by number (not id)"
  app.list_all_people(true)
  person_idx = gets.chomp.to_i
  print "\nDate: "
  date = gets.chomp
  app.create_rental(book_idx, person_idx, date)
  puts 'Rental created successfully'
end

def create_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def list_rentals(app)
  print 'ID of person: '
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

def main
  app = App.new
  exit = false
  puts "Welcome to School Library App! \n\n"

  until exit
    show_options
    option = gets.chomp
    case option
    when '1' then app.list_all_books
    when '2' then app.list_all_people
    when '3' then create_person(app)
    when '4' then create_book(app)
    when '5' then create_rentals(app)
    when '6' then list_rentals(app)
    when '7'
      puts 'Thank you for using this app!'
      exit = true
    end

  end
end

main