#command line ui class for flashcards
#dustinmoorman@gmail.com

require_relative 'os'

class Clui
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

header
  uin = gets.chomp
  end

  def clearConsole
    if OS.linux? or OS.mac? or OS.unix?
	system 'clear'
    elsif OS.windows?
        system 'cls'
    end
  end
end
