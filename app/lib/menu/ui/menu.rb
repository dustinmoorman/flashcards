autoload :OS, 'menu/tools/os'
autoload :Messenger, 'menu/tools/messenger'

class Menu
  include OS
  attr_accessor :messenger
  def initialize
    @messenger = Messenger.new
    @nav_opts = Hash.new
    @location = 'Menu'
  end
  def clearConsole
    if OS::Detect.linux? or OS::Detect.mac? or OS::Detect.unix?
      system 'clear'
    elsif OS::Detect.windows?
      system 'cls'
    end
  end
  def getMenu
    self.clearConsole
    self.setOpts
    print self.getHeader
    @nav_opts.each do |key, opt|
      puts "#{key}. #{opt}"
    end
  end
  def getHeader
  	header = <<hdr

 .-.       .              .
-|-| .-. .-|-. .-.-. .-..-| .-
 ' '-`-`--'' '-`-`-`-'  `-'--'
by dustin moorman

===============================

  :: #{@location}

hdr
    return header
  end
end