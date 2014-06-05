require 'menu/ui/main'
require 'exam/ui/manage'
require 'exam/ui/take'
require 'exam/ui/results'

class Main < Ui::Menu
  def setOpts
    @nav_opts['Manage exams'] = Exam::Ui::Manage.new
    @nav_opts['Take an exam'] = Exam::Ui::Take.new
    @nav_opts['See results'] = Exam::Ui::Results.new
    @nav_opts['exit'] = self #@TODO: tosser, this calls it. Need an exit flag
    @location = 'Main'
  end
end
