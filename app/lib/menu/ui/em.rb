autoload :Menu, 'menu/ui/menu'

class Em < Menu
  def setOpts
    @nav_opts['1'] = 'List Exams'
    @nav_opts['2'] = 'Add Exam'
    @nav_opts['3'] = 'Remove Exam'
    @nav_opts['4'] = 'back'
    @location = 'Exam Management'
  end
end