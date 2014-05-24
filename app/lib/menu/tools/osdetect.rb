# Osdetect detection module
#dustinmoorman@gmail.com

module OS
  class Detect
    def windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def unix?
      !self.windows?
    end

    def linux?
      self.unix? and not self.mac?
    end
  end
end
