require_relative 'app'
require_relative 'menu_handler'
require_relative 'person_creator'
require_relative 'book_creator'
require_relative 'rental_creator'
require_relative 'rentals_lister'
require_relative 'app_runner'

app = App.new
person_creator = PersonCreator.new(app)
book_creator = BookCreator.new(app)
rental_creator = RentalCreator.new(app)
rentals_lister = RentalsLister.new(app)
menu_handler = MenuHandler.new(app, person_creator, book_creator, rental_creator, rentals_lister)

AppRunner.new(app, menu_handler).run
