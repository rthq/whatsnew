# Whatsnew

What's new is a gem for maintaining structured release notes in your source tree. It supports release abstracts and release variants.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whatsnew', git: 'git@roundtablehq.git.beanstalkapp.com:/roundtablehq/gem-whats-new.git'
```

And then execute:

    $ bundle

## Usage

### Configure releases folder

Set the directory containing release markdown. In rails create a `config/initializers/whatsnew.rb` with the following content.

```ruby
Whatsnew.configure do |config|
  config.releases_dir = Rails.root.join('config', 'releases')
end
```

### Create release notes

Create markdown release notes in the releases folder. These following a naming convention `release-#{@version}.md"`

```
$ tree test/examples/
test/examples/
├── release-5.0.0.md
├── release-5.0.0.starwood.md
├── release-5.0.1.md
├── release-abstract-5.0.0.md
└── releases.yml
```

Add versions to `releases.yml` (also in the releases directory)

```yaml
# Put each new release number at the top of this file
- "5.0.1"
- "5.0.0"
- "4.3.2"
- "4.2.1"
```

### Reference in your application code

Access the full list of releases

```ruby
Whatsnew::Release.all
```

Show the latest release

```ruby
Whatsnew::Release.last
```

Access a release abstract

```ruby
Whatsnew::Release.last.abstract
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/whatsnew/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
