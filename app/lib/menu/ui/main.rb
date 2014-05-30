autoload :Menu, 'menu/ui/menu'
autoload :Manage, 'exam/ui/manage'
autoload :Take, 'exam/ui/take'
autoload :Results, 'exam/ui/results'

class Main < Menu
  def setOpts
    @nav_opts['Manage exams'] = self
    @nav_opts['Take an exam'] = self
    @nav_opts['See results'] = self
    @nav_opts['exit'] = self.exit
    @location = 'Main'
  end
end
