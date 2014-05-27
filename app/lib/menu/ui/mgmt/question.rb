autoload :Menu, 'menu/ui/menu'

class Qm < Menu
  def setOpts
    @nav_opts['1'] = 'List Questions'
    @nav_opts['2'] = 'Add Question'
    @nav_opts['3'] = 'Remove Question'
    @nav_opts['4'] = 'back'
    @location = 'Question Management'
  end
end