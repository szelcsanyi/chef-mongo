# mongo cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-mongo.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-mongo)

## Description

Configures [Mongodb](http://mongodb.org) via Opscode Chef

It can handle multiple instances with different configuratioins and differend versions on the same machine.

## Supported Platforms

* Ubuntu
* Debian

## Recipes

* `mongo` - The default no-op recipe.

## Providers
* `mongo_db` - Configures mongodb instance

## Usage
###Provider parameters:

* `url`: url for mongodb binary
* `home`: directory for mongodb instance (default "/opt")
* `bind_ip`: listen address (default "127.0.0.1")
* `port`: listen port (default 27017)
* `default_instance`: creates symlink (default false)
* `replSet`: replica set name (default not set)

#### A mongodb instance with custom parameters:
```ruby
mongo_db "example" do
    port '27017'
    bind_ip '0.0.0.0'
    default_instance true
end
```

## TODO
Implement sharded cluster support.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2014/license.html).
* Copyright (c) 2014 Gabor Szelcsanyi

