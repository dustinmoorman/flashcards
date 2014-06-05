module Menu
  module Tools
    class Messenger
      def push(x)
        @message = x
      end
      def getMessage
        return @message
      end
    end
  end
end
