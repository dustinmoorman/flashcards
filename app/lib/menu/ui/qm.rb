autoload :Menu, 'menu/ui/menu'

class Qm < Menu
  def getMenu
    self.clearConsole
    puts <<header

 .-.       .              .
-|-| .-. .-|-. .-.-. .-..-| .-
 ' '-`-`--'' '-`-`-`-'  `-'--'
by dustin moorman

===============================

  :: Question Management

1. List Questions
2. Add Question
3. Remove Question
4. back

header
  end
end