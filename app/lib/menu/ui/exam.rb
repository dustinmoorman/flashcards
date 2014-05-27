autoload :Menu, 'menu/ui/menu'

module Mgmt
  class Exam < Menu
    def self.setOpts
      @nav_opts['List Exams'] = self #str8 pluqqin 
      @nav_opts['Add Exam'] = self #str8 pluqqin
      @nav_opts['Remove Exam'] = self 
      @nav_opts['back'] = self
      @location = 'Exam Management'
    end
  end
  class Qm < Menu
    def setOpts
      @nav_opts['1'] = 'List Questions'
      @nav_opts['2'] = 'Add Question'
      @nav_opts['3'] = 'Remove Question'
      @nav_opts['4'] = 'back'
      @location = 'Question Management'
    end
  end
end