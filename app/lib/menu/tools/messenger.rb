#messenger class to be used with clui
#dustinmoorman@gmail.com

class Messenger
  def push(x)
    @message = x
  end

  def getMessage
    return @message
  end
end
