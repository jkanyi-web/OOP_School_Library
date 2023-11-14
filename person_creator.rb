class PersonCreator
  def initialize(app)
    @app = app
  end

  def create_person
    puts 'Is the person a teacher? (y/n)'
    is_teacher = gets.chomp.downcase == 'y'
    puts 'Enter ID:'
    id = gets.chomp.to_i
    puts 'Enter age:'
    age = gets.chomp.to_i
    puts 'Enter name:'
    name = gets.chomp

    @app.create_person(is_teacher, id, age, name)
  end
end
