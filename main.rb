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

def display_menu_options(menu_options)
  puts "\nPlease choose an option by entering a number:"
  menu_options.each { |key, value| puts "#{key} - #{value[:description]}" }
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
  menu_options = {
    '1' => { description: 'List all books', action: -> { app.list_all_books } },
    '2' => { description: 'List all people', action: -> { app.list_all_people } },
    '3' => { description: 'Create a person', action: -> { create_person(app) } },
    '4' => { description: 'Create a book', action: -> { create_book(app) } },
    '5' => { description: 'Create a rental', action: -> { create_rentals(app) } },
    '6' => { description: 'List all rentals for a given person id', action: -> { list_rentals(app) } },
    '7' => { description: 'Exit', action: -> { exit = true } }
  }

  puts "Welcome to School Library App! \n\n"

  until exit
    display_menu_options(menu_options)
    option = gets.chomp

    if menu_options.key?(option)
      menu_options[option][:action].call
    else
      puts 'Invalid option'
    end
  end

  puts 'Thank you for using this app!'
end


main
