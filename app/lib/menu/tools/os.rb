# Osdetect detection module
#dustinmoorman@gmail.com

module OS
  module Detect
    def self.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def self.mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def self.unix?
      !self.windows?
    end

    def self.linux?
      self.unix? and not self.mac?
    end
  end
end
