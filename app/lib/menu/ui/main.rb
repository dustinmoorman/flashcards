require_relative 'menu'

class Main < Ui::Menu
  def setOpts
    @nav_opts['Manage exams'] = Exam::Ui::Manage.new
    @nav_opts['Take an exam'] = Exam::Ui::Take.new
    @nav_opts['See results'] = Exam::Ui::Results.new
    @nav_opts['exit'] = self.exit
    @location = 'Main'
  end
end
