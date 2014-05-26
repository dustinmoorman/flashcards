autoload :OS, 'menu/tools/os'

class Menu
  include OS

  def clearConsole
    if OS::Detect.linux? or OS::Detect.mac? or OS::Detect.unix?
      system 'clear'
    elsif OS::Detect.windows?
      system 'cls'
    end
  end
end