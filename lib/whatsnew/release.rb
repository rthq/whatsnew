require 'yaml'

module Whatsnew

  class Release
    @all_releases = nil
    attr_reader :version

    def self.release_dir
      ::Whatsnew.configuration.releases_dir
    end

    def self.all
      self.reload if @all_releases.nil?
      @all_releases
    end

    def self.reload
      release_file = YAML::load_file(File.join(self.release_dir, 'releases.yml'))
      @all_releases = release_file.map {|v| Release.new(v) }
    end 

    def initialize(version)
      @version = version
      # @has_abstract = File.exists?(abstract_file)
    end
  end
end