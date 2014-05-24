# Osdetect detection module
#dustinmoorman@gmail.com

module OSDetect
  def OSDetect.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OSDdetect.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OSDetect.unix?
    !OSDetect.windows?
  end

  def OSDetect.linux?
    OSDetect.unix? and not OSDetect.mac?
  end
end
