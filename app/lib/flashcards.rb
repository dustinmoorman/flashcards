#flashcards
#dustinmoorman@gmail.com

autoload :Main, 'menu/ui/main'

class Flashcards
  def Run
    main = Main.new

    loop do
      main.getMenu
      puts main.messenger.getMessage
      uin = gets.chomp
      case uin
        when '1'
          main.messenger.push('user chose 1')
        when '2'
          main.messenger.push('user chose 2')
        when '3'
          main.messenger.push('user chose 3')
        when '4'
          break
        else
          main.messenger.push('try again')
      end
    end
  end
end