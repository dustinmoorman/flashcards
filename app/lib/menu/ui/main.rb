autoload :Menu, 'menu/ui/menu'
autoload :Exam, 'menu/ui/exam'

class Main < Menu
  def setOpts
    @nav_opts['Manage exams'] = Exam::Manage.new
    @nav_opts['Take an exam'] = Exam::Take.new 
    @nav_opts['See results'] = Exam::Results.new
    @nav_opts['exit'] = self.exit
    @location = 'Main'
  end
end