autoload :Menu, 'menu/ui/menu'

class Main < Menu
  def setOpts
    @nav_opts['1'] = 'Manage tests'
    @nav_opts['2'] = 'Take a test'
    @nav_opts['3'] = 'See results'
    @nav_opts['4'] = 'exit'
    @location = 'Main'
  end
end