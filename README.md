# Maruku::Ext::LtsvTable

Maruku extension for table written by ltsv format.

## Installation

Add this line to your application's Gemfile:

    gem 'maruku-ext-ltsv_table'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maruku-ext-ltsv_table

## Usage

Just load.

    require 'maruku'
    require 'maruku/ext/ltsv_table'
    
    html = Maruku.new("
      1:a\t2:b
      1:c\t2:d
    ").to_html

When using maruku command, pass by `--ext` option.

    $ maruku --ext ltsv_table a.md

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
