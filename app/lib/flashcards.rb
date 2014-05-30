#flashcards
#dustinmoorman@gmail.com

require_relative 'menu/ui/main'

class Flashcards
  def initialize
    @main = Main.new
  end
  def Run
      @main.getMenu
  end
end
