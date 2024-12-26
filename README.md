### Hexlet tests and linter status:
[![Actions Status](https://github.com/victor24k/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/victor24k/rails-project-63/actions)

# HexletCode

Simple HTML forms generator.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

## Usage

Lets suppose you have the following user object which you want to use inside the form:
```Ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
bob = User.new(name: "Bob", job: "Unemployeed", gender: "Male")
```
You can create the form like this:
```Ruby
form = HexletCode.form_for bob do |f|
  f.input :name
  f.input :gender
  f.input :job, as: :text
end
```
This will produce the following HTML code:
```HTML
<form action="#" method="post">
    <label for="name">Name</label>
    <input name="name" type="text" value="Bob">
    <label for="gender">Gender</label>
    <input name="gender" type="text" value="Male">
    <label for="job">Job</label>
    <textarea name="job" cols="20" rows="40">Unemployeed</textarea>
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
