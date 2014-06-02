require 'menu/ui/menu'

class Manage < Ui::Menu
  def setOpts
    @nav_opts['1'] = 'List Questions'
    @nav_opts['2'] = 'Add Question'
    @nav_opts['3'] = 'Remove Question'
    #@nav_opts['4'] = self.back @TODO Implement historian & back method for menu
    @location = 'Question Management'
  end
end