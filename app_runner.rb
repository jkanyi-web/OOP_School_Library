class AppRunner
  def initialize(app, menu_handler)
    @app = app
    @menu_handler = menu_handler
  end

  def run
    loop do
      @menu_handler.display_menu
      choice = gets.chomp.to_i
      @menu_handler.handle_option(choice)
    end
  end
end
