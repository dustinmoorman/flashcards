#flashcards
#dustinmoorman@gmail.com

autoload :Main, 'menu/ui/main'
autoload :Em, 'menu/ui/em'

class Flashcards
  def initialize
    @main = Main.new
    @em   = Em.new

  end
  def Run
      @main.getMenu
  end
end