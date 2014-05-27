autoload :Menu, 'menu/ui/menu'
autoload :Em, 'menu/ui/em'

class Main < Menu
  def initialize
    super
    @Em = Em.new
  end
  def setOpts
    @nav_opts['Manage tests'] = @Em
    @nav_opts['2'] = 'Take a test'
    @nav_opts['3'] = 'See results'
    @nav_opts['4'] = 'exit'
    @location = 'Main'
  end
end