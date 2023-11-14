class RentalsLister
  def initialize(app)
    @app = app
  end

  def list_rentals_for_person
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    @app.list_rentals_for_person(person_id)
  end
end
