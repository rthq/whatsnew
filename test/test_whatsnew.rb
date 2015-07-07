require 'minitest_helper'

class TestWhatsnew < Minitest::Test

  def setup
    Whatsnew.configure do |config|
      config.releases_dir = File.expand_path( 'examples', __dir__ )
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Whatsnew::VERSION
  end

  def test_release_all_returns_list_of_releases
    releases = ::Whatsnew::Release.all

    assert_equal %W{5.0.1 5.0.0 4.3.2 4.2.1}, releases.map(&:version)
  end

  # test "Release.last returns the lastest version" do
  #   assert_equal "5.0.1", Release.last.version
  # end

  # test "Release.new_release_for? returns true if the user hasn't viewed the latest release note" do
  #   user = FactoryGirl.create :user, latest_version: "5.0.0"

  #   assert Release.new_release_for?(user)
  # end

  # test "Release.new_release_for? returns false if the user has viewed the latest release note" do
  #   user = FactoryGirl.create :user, latest_version: "5.0.1"

  #   assert !Release.new_release_for?(user)
  # end

  # test "Release#markdown returns markdown notes for a release" do
  #   release = Release.new "5.0.1"

  #   assert_equal "# Dude, check this awesome software!", release.markdown
  # end

  # test "Release#markdown returns the installation variant if exists" do
  #   release = Release.new "5.0.0"

  #   assert_equal "# Starwood variant", release.markdown(:starwood)
  # end

  # test "Release#markdown returns a regular variant if no installation specific variant exists" do
  #   release = Release.new "5.0.1"

  #   assert_equal "# Dude, check this awesome software!", release.markdown(:starwood)
  # end

  # test "Release#markdown returns nil for non-existent releases" do
  #   release = Release.new "6.6.6"

  #   assert_nil release.markdown
  # end

  # test "Release#abstract returns file contents if it exists" do
  #   release = Release.new "5.0.0"

  #   assert_equal "Abstract of release 5.0.0", release.abstract
  # end

  # test "Release#abstract? returns true if it exists" do
  #   release = Release.new "5.0.0"

  #   assert_equal true, release.abstract?
  # end

  # test "Release#abstract returns nil if it doesn't exist" do
  #   release = Release.new "5.0.1"

  #   assert_equal nil, release.abstract
  # end

  # test "Release#abstract? returns false if it doesn't exist" do
  #   release = Release.new "5.0.1"

  #   assert_equal false, release.abstract?
  # end

  # test "Release#view sets the users latest_version attribute" do
  #   release = Release.new "5.0.1"

  #   user = FactoryGirl.create :user

  #   release.view!(user)

  #   user.reload

  #   assert_equal "5.0.1", user.latest_version
  # end
end
