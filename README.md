# Chivy

Offers a quick way of analyzing language YAML-files and to add missing translation keys from the CLI.

[![Gem Version](https://img.shields.io/gem/v/chivy.svg)](https://rubygems.org/gems/chivy)
[![Gem Downloads](https://img.shields.io/gem/dt/chivy.svg)](https://rubygems.org/gems/chivy)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://rubydoc.info/github/dahie/chivy)


## Installation

Add this line to your application's Gemfile:

```rb
gem 'chivy', require: false
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install chivy
```

## Usage

```shell
$ chivy list config/locales/
```

Will search in the directory `config/locales` for all translation yaml-files by the schema "<name>.<locale>.yml" and will output a list of the minimal changeset between both translations.

## Testing

The project classes are tested through rspec.

```shell
$ rspec
```

The command line interface is tested through cucmber/aruba.

```shell
$ cucumber
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
