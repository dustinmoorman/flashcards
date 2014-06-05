require_relative '../tools/os'
require_relative '../tools/messenger'

module Ui
  class Menu
    include OS
    attr_accessor :messenger
    def initialize
      @messenger = ::Menu::Tools::Messenger.new
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
      loop do
        self.clearConsole
        self.setOpts
        print self.getHeader
        pos = 1
        commands = Hash.new
        @nav_opts.each do |desc, concreteMenu|
          puts pos.to_s + " #{desc}"
          commands[pos.to_s] = concreteMenu
          pos += 1
        end
        puts @messenger.getMessage        
	      self.processInput(gets.chomp, commands)
      end
    end
    def processInput(uin, commands) 
      if commands.key? uin
        if commands[uin].respond_to? 'getMenu'
          # @historian.push(commands[uin]) @TODO implement
          commands[uin].getMenu
        elsif commands[uin] == 'exit'
          self.exit
        elsif commands[uin] == 'back'
          # @historian.back @TODO implement
        end
      else
        @messenger.push('try again')
      end
    end
    def exit
      exit!
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
end

