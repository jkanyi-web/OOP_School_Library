# student.rb
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def self.belongs_to(association)
    define_method(association) do
      instance_variable_get("@#{association}")
    end

    define_method("#{association}=") do |value|
      instance_variable_set("@#{association}", value)
    end
  end

  belongs_to :classroom

  attr_accessor :name

  def initialize(id, age, name = 'unknown')
    super(id, age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
