require 'yaml'

module Whatsnew

  class Release
    @all_releases = nil
    attr_reader :version

    def self.releases_dir
      ::Whatsnew.configuration.releases_dir
    end

    def self.all
      self.reload if @all_releases.nil?
      @all_releases
    end

    def self.reload
      release_file = YAML::load_file(File.join(self.releases_dir, 'releases.yml'))
      @all_releases = release_file.map {|v| Release.new(v) }
    end 

    # Returns the latest release (first in the yaml file)
    def self.last
      self.all.first
    end

    def self.new_release_since?( version )
      self.last.version != version
    end

    def initialize(version)
      @version = version
      @has_abstract = File.exists?(abstract_file)
    end

    def markdown(variant = nil)
      unless variant.nil?
        variant_file = "#{Release.releases_dir}/release-#{@version}.#{variant}.md"
        return IO.read(variant_file) if File.exists?(variant_file)
      end

      regular_file = "#{Release.releases_dir}/release-#{@version}.md"
      if File.exists?(regular_file)
        IO.read(regular_file)
      else
        nil
      end
    end

    def abstract
      IO.read(abstract_file) if abstract?
    end

    def abstract?
      @has_abstract
    end

    private

      def abstract_file
        "#{Release.releases_dir}/release-abstract-#{@version}.md"
      end


  end
end