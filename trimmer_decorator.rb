class TrimmerDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end
