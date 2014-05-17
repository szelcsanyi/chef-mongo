# memcached cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-memcached.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-memcached)

## Description

Configures [Memcached](http://memcached.org) via Opscode Chef

It can handle multiple instances with different configuratioins on the same machine.

Currently only one version is supported.

## Supported Platforms

* Ubuntu
* Debian

## Recipes

* `memcached` - The default no-op recipe.

## Providers
* `memcached_pool` - Configures memcached instance

## Usage
###Provider parameters:

* `tcp_port`: tcp listen port (default 11211)
* `udp_port`: udp listen port (default 0, disable)
* `listen`: listen address (default "127.0.0.1")
* `connection_limit`: client connection limit (default 1024)
* `size`: database size in megabytes (defaul 16)
* `repcache_port`: repcache port (default not set)
* `repcache_listen`: repcache listen address (default not set)
* `verbose`: verbose logging (default not set, [-v or -vv])

#### A memcached instance with default settings:
```ruby
memcached_pool "basic_example"
```

#### A memcached instance with custom parameters:
```ruby
memcached_pool "extended_example" do
    port "11212"
    bind "0.0.0.0"
    size 64
end
```

## TODO
Implement multiversion support.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2014/license.html).
* Copyright (c) 2014 Gabor Szelcsanyi

