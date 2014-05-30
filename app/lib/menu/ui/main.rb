require_relative 'menu'

class Main < Menu
  def setOpts
    @nav_opts['Manage exams'] = self
    @nav_opts['Take an exam'] = self
    @nav_opts['See results'] = self
    @nav_opts['exit'] = self
    @location = 'Main'
  end
end
