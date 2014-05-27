autoload :Menu, 'menu/ui/menu'
autoload :Em, 'menu/ui/em'

class Main < Menu
  def initialize
    super
    @Em = Em.new
  end
  def setOpts
    @nav_opts['Manage tests'] = @Em
    @nav_opts['Take a test'] = @Em #pluggin for now
    @nav_opts['See results'] = @Em #pluggin for now
    @nav_opts['exit'] = @Em #pluggin for now
    @location = 'Main'
  end
end