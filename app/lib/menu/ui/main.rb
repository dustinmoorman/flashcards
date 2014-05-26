autoload :Menu, 'menu/ui/menu'

class Main < Menu
  def setOpts
    @nav_opts['1'] = 'Manage questions'
    @nav_opts['2'] = 'Take a test'
    @nav_opts['3'] = 'See results'
    @nav_opts['4'] = 'exit'
  end
  def getMenu
    self.clearConsole
    self.setOpts
    print self.getHeader
    @nav_opts.each do |key, opt|
      puts "#{key}. #{opt}"
    end
  end
end