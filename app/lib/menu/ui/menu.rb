autoload :OS, 'menu/tools/os'
autoload :Messenger, 'menu/tools/messenger'

class Menu
  include OS
  attr_accessor :messenger

  def initialize
    @messenger = Messenger.new
  end

  def clearConsole
    if OS::Detect.linux? or OS::Detect.mac? or OS::Detect.unix?
      system 'clear'
    elsif OS::Detect.windows?
      system 'cls'
    end
  end
end