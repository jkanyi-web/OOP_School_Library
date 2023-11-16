require 'json'
class PeopleManager
  attr_accessor :people

  def initialize
    @people = []
  end

  def load_people_data
    load_people
  end

  def save_people_data
    save_people
    puts 'Person saved!'
  rescue StandardError => e
    puts "Error saving person data: #{e.message}"
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.puts @people.map { |person|
                  {
                    'id' => person.id,
                    'age' => person.age,
                    'name' => person.name
                  }
                }.to_json
    end
  end

  private

  def load_people
    return unless File.exist?('people.json') && !File.empty?('people.json')

    json_str = File.read('people.json')
    @people = JSON.parse(json_str).map do |person_data|
      Person.new(person_data['id'], person_data['age'], person_data['name'])
    end
  end
end
