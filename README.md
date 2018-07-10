# Rubylite

This is a command line tool which can interact with databases

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubylite'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubylite

## Usage

To open any database use
```ruby
db_open('database_name') # This will show list of all the tables in the database
```
Let's say **users** is a table
```ruby
|_id_|__name__|
|  1 | 'vbhv' |
|  2 | 'luci' |

Users.first # 1 vbhv
Users.last # 2 luci
Users.find_by('name', 'vbhv') # 1 vbhv
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vbhv007/rubylite. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubylite project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/vbhv007/rubylite/blob/master/CODE_OF_CONDUCT.md).
