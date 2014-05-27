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
    loop do
      @main.getMenu
      puts @main.messenger.getMessage
      uin = gets.chomp
      case uin
        when '1'
          @em.getMenu
        when '2'
          @main.messenger.push('user chose 2')
        when '3'
          @main.messenger.push('user chose 3')
        when '4'
          break
        else
          @main.messenger.push('try again')
      end
    end
  end
end