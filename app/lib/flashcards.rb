#flashcards
#dustinmoorman@gmail.com

autoload :Main, 'ui/main'

class Flashcards
  def Run
    clui = Main.new

    loop do
      clui.getMenu
      puts clui.messenger.getMessage
      uin = gets.chomp
      case uin
        when '1'
          clui.messenger.push('user chose 1')
        when '2'
          clui.messenger.push('user chose 2')
        when '3'
          clui.messenger.push('user chose 3')
        when '4'
          break
        else
          clui.messenger.push('try again')
      end
    end
  end
end