class NameablePerson < Person
  include Nameable
  def correct_name
    @name
  end
end
