require_relative('./app')

class PersonCreator
  def initialize(app)
    @app = app
  end

  def create_person
    print 'Do you want to create a stduent (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    if choice == '1'
      create_student
    elsif choice == '2'
      create_teacher
    else
      puts 'Invalid choice'
    end
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    @app.create_student(age, name, permission)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @app.create_teacher(age, name, specialization)
    puts 'Person created successfully'
  end
end

class LibraryActions
  def initialize(app)
    @app = app
  end

  def create_rentals
    puts 'Select a book from the following list by number'
    puts '========================================================================='
    @app.list_all_books(select: true)
    puts '========================================================================='
    book_idx = gets.chomp.to_i
    puts "\nSelect a person from the following list by number (not id)"
    puts '========================================================================='
    @app.list_all_people(select: true)
    puts '========================================================================='
    person_idx = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    @app.create_rental(book_idx, person_idx, date)
    puts 'Rental created successfully'
  end

  def list_all_books
    puts '========================================================================='
    @app.list_all_books
    puts '========================================================================='
  end

  def list_all_people
    puts '========================================================================='
    @app.list_all_people
    puts '========================================================================='
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
    puts 'Book created successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts '========================================================================='
    @app.list_rentals_for_person(person_id)
    puts '========================================================================='
  end
end

class Main
  def initialize
    @app = App.new
    @library = LibraryActions.new(@app)
    @persons = PersonCreator.new(@app)
    @exit = false
  end

  def start
    puts "Welcome to School Library App! \n\n"
    until @exit
      show_options
      option = gets.chomp
      options = {
        '1' => @library.method(:list_all_books),
        '2' => @library.method(:list_all_people),
        '3' => @persons.method(:create_person),
        '4' => @library.method(:create_book),
        '5' => @library.method(:create_rentals),
        '6' => @library.method(:list_rentals),
        '7' => lambda {
                 puts 'Thank you for using this app!'
                 @exit = true
               }
      }
      options[option].call
    end
  end

  private

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
end

Main.new.start
