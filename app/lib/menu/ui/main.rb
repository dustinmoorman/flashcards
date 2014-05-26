autoload :OS, 'menu/tools/os'
autoload :Messenger, 'menu/tools/messenger'
autoload :Menu, 'menu/ui/menu'

class Main < Menu
  attr_accessor :messenger

  def initialize
    @messenger = Messenger.new
    @OSDetect = OS::Detect.new
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

  def clearConsole
    if @OSDetect.linux? or @OSDetect.mac? or @OSDetect.unix?
      system 'clear'
    elsif @OSDetect.windows?
      system 'cls'
    end
  end
end