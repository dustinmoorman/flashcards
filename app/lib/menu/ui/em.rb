autoload :Menu, 'menu/ui/menu'

class Em < Menu
  def getMenu
    self.clearConsole
    puts <<header

 .-.       .              .
-|-| .-. .-|-. .-.-. .-..-| .-
 ' '-`-`--'' '-`-`-`-'  `-'--'
by dustin moorman

===============================

  :: Exam Management

1. List Exams
2. Add Exam
3. Remove Exam
4. back

header
  end
end