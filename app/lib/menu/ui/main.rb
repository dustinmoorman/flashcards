autoload :Messenger, 'menu/tools/messenger'
autoload :Menu, 'menu/ui/menu'

class Main < Menu
  attr_accessor :messenger

  def initialize
    @messenger = Messenger.new
    #@OSDetect = OS::Detect.new
  end

  def getMenu
    self.clearConsole
    puts <<header

 .-.       .              .
-|-| .-. .-|-. .-.-. .-..-| .-
 ' '-`-`--'' '-`-`-`-'  `-'--'
by dustin moorman

===============================

  :: Main

1. Question Management
2. Take a test
3. See results
4. exit

header
  end
end