autoload :Menu, 'menu/ui/menu'

class Qm < Menu
  def setOpts
    @nav_opts['1'] = 'List Questions'
    @nav_opts['2'] = 'Add Question'
    @nav_opts['3'] = 'Remove Question'
    @nav_opts['4'] = 'back'
  end
  def getMenu
    self.clearConsole
    puts self.getHeader + @location
    @nav_opts.each do |key, opt|
      puts "#{key}. #{opt}"
    end

    return output
  end
end