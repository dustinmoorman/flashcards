autoload :Menu, 'menu/ui/menu'
autoload :Em, 'menu/ui/em'

class Main < Menu
  def setOpts
    @nav_opts['Manage tests'] = Em.new
    @nav_opts['Take a test'] = Em.new #pluggin for now
    @nav_opts['See results'] = Em.new #pluggin for now
    @nav_opts['exit'] = Em.new #pluggin for now
    @location = 'Main'
  end
end