autoload :Menu, 'menu/ui/menu'

class Em < Menu
  def setOpts
    @nav_opts['List Exams'] = self #str8 pluqqin 
    @nav_opts['Add Exam'] = self #str8 pluqqin
    @nav_opts['Remove Exam'] = self 
    @nav_opts['back'] = self
    @location = 'Exam Management'
  end
end