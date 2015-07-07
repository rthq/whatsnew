require "whatsnew/version"
require "whatsnew/configuration"

module Whatsnew
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
