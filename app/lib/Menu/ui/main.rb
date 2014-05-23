autoload :Menu, 'menu/ui/menu'

class Main < Menu
  attr_accessor :messenger

  def initialize
    @messenger = Messenger.new
  end

  def getMenu
    self.clearConsole
    puts <<header

 .-.       .              .
-|-| .-. .-|-. .-.-. .-..-| .-
 ' '-`-`--'' '-`-`-`-'  `-'--'
by dustin moorman

***************************************

1. Question Management
2. Take a test
3. See results
4. exit

header
  end

  def clearConsole
    if OS.linux? or OS.mac? or OS.unix?
      system 'clear'
    elsif OS.windows?
      system 'cls'
    end
  end
end