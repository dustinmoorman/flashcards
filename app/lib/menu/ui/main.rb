autoload :Menu, 'menu/ui/menu'
autoload :Manage, 'exam/ui/manage'
autoload :Take, 'exam/ui/take'
autoload :Results, 'exam/ui/results'

class Main < Menu
  def setOpts
    @nav_opts['Manage exams'] = Exam::Manage.new
    @nav_opts['Take an exam'] = Exam::Take.new 
    @nav_opts['See results'] = Exam::Results.new
    @nav_opts['exit'] = self.exit
    @location = 'Main'
  end
end