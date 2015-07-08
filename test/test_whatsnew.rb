require 'minitest_helper'

module Whatsnew
  class TestWhatsnew < Minitest::Test

    def setup
      ::Whatsnew.configure do |config|
        config.releases_dir = File.expand_path( 'examples', __dir__ )
      end
    end

    def test_that_it_has_a_version_number
      refute_nil ::Whatsnew::VERSION
    end

    def test_release_all_returns_list_of_releases
      releases = Release.all

      assert_equal %W{5.0.1 5.0.0 4.3.2 4.2.1}, releases.map(&:version)
    end

    def test_last_returns_the_latest_version
      assert_equal "5.0.1", Release.last.version
    end

    def test_new_release_since_is_true_if_new_release
      assert Release.new_release_since?( "5.0.0" )
    end

    def test_new_release_since_is_false_if_no_new_release
      assert !Release.new_release_since?( "5.0.1" )
    end
    
    def test_release_markdown_returns_markdown
      release = Release.new "5.0.1"
      assert_equal "# Dude, check this awesome software!", release.markdown
    end

    def test_release_markdown_returns_variant_if_file_exists
      release = Release.new "5.0.0"
      assert_equal "# Starwood variant", release.markdown(:starwood)
    end

    def test_release_markdown_returns_regular_if_no_varient_exists
      release = Release.new "5.0.1"
      assert_equal "# Dude, check this awesome software!", release.markdown(:starwood)
    end

    def test_release_markdown_returns_nil_for_non_existent_releases
      release = Release.new "6.6.6"

      assert_nil release.markdown
    end

    def test_release_abstract_returns_contents_if_file_exists
      release = Release.new "5.0.0"
      assert_equal "Abstract of release 5.0.0", release.abstract
    end

    def test_release_abstract_returns_true_if_file_exists
      release = Release.new "5.0.0"
      assert_equal true, release.abstract?
    end

    def test_release_abstract_returns_nil_if_file_not_exists
      release = Release.new "5.0.1"
      assert_equal nil, release.abstract
    end

    def test_release_abstract_returns_false_if_file_not_exists
      release = Release.new "5.0.1"
      assert_equal false, release.abstract?
    end

  end
end