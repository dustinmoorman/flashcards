require_relative '../tools/os'
require_relative '../tools/messenger'
module Flashcards
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
      loop do
        self.clearConsole
        self.setOpts
        print self.getHeader
        pos = 1
        commands = Hash.new
        @nav_opts.each do |desc, concreteMenu|
          puts pos.to_s + " #{desc}"
          commands[pos] = concreteMenu
          pos += 1
        end
        puts @messenger.getMessage
        uin = gets.chomp
        case uin
          when '1'
            commands[1].getMenu
          when '2'
            commands[2].getMenu
          when '3'
            commands[3].getMenu
          when '4'
            break
          else
            @messenger.push('try again')
        end
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
end
