#flashcards
#dustinmoorman@gmail.com

autoload :Main, 'menu/ui/main'

class Flashcards
  def initialize
    @main = Main.new
  end
  def Run
      @main.getMenu
  end
end