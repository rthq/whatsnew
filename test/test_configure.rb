require "minitest_helper"

class TestConfigure < Minitest::Test

  def test_releases_dir_configurable
    Whatsnew.configure do |config|
      config.releases_dir = '/home/projects/example/releases'
    end
    assert_equal '/home/projects/example/releases', Whatsnew.configuration.releases_dir
  end

end