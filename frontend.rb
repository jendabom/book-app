require 'unirest'
while true
  p "What would you like to see?"
  p "[1] Show all books"
  p "[2] See a specific Book"
  p "[3] Create a book"
  p "[4] Delete a book"
  p "[5] Update a book"

  user_input = gets.chomp

  if user_input == "1"
    response = Unirest.get("localhost:3000/books")
    p response.body
  elsif user_input == "2"
    p "What book would you like to see?"
    selected_book_input = gets.chomp
    response = Unirest.get("localhost:3000/books/#{selected_book_input}")
    p response.body
  elsif user_input == "3"
    p "Let's create a book"
    p "Please enter the name of the book:"
    input_title = gets.chomp
    p "Enter description:"
    input_description = gets.chomp
    p "Enter amount of pages:"
    input_pages = gets.chomp.to_i
    response = Unirest.post("localhost:3000/books", parameters: {title: input_title, description: input_description, pages: input_pages})
    p response.body
  elsif user_input == "4"
    p "What book would you like to delete?"
    selected_book_input = gets.chomp
    response = Unirest.delete("localhost:3000/books/#{selected_book_input}")
    p response.body
  elsif user_input == "5"
    p "What book would you like to update?"
    selected_book_input = gets.chomp
    p "Please enter the name of the book:"
    input_title = gets.chomp
    p "Enter description:"
    input_description = gets.chomp
    p "Enter amount of pages:"
    input_pages = gets.chomp.to_i
    response = Unirest.patch("localhost:3000/books/#{selected_book_input}", parameters: {title: input_title, description: input_description, pages: input_pages})
  end
end