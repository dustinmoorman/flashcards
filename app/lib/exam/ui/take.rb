require 'menu/ui/menu'

module Exam
  module Ui
    class Take < ::Menu::Ui::Menu
      def setOpts
        @nav_opts['List Exams'] = self #str8 pluqqin @TODO this will probably list automatically
        @nav_opts['back'] = self
        @location = 'Take Exam'
      end
    end
  end
end
