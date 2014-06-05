require 'menu/ui/menu'

module Exam
  module Ui
    class Results < ::Menu::Ui::Menu
      def setOpts
        @nav_opts['Select Exam'] = self #str8 pluqgin
        @nav_opts['back'] = self
        @location = 'Exam Results'
      end
    end
  end
end
