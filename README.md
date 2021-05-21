# L7-mongo cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-mongo.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-mongo)
[![security](https://hakiri.io/github/szelcsanyi/chef-mongo/master.svg)](https://hakiri.io/github/szelcsanyi/chef-mongo/master)
[![Cookbook Version](https://img.shields.io/cookbook/v/L7-mongo.svg?style=flat)](https://supermarket.chef.io/cookbooks/L7-mongo)

## Description

Configures [Mongodb](http://mongodb.org) via Opscode Chef

It can handle multiple instances with different configuratioins and different versions on the same machine.

Please note that this cookbook does not use the 10gen apt repository, and instead downloads the required binaries from a given server.

## Supported Platforms

* Ubuntu 12.04+
* Debian 7.0+

## Recipes

* `L7-mongo`- The default no-op recipe.

## Providers

* `L7_mongo_db` - Configures a mongodb instance
* `L7_mongo_s` - Configures a mongos instance

## Usage

### Parameters for the `L7_mongo_db` provider:

* `url`: url for mongodb binary tgz (default: https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.1.tgz)
* `home`: directory for mongodb instance (default "/opt")
* `bind_ip`: listen address (default "127.0.0.1")
* `port`: listen port (default 27017)
* `default_instance`: creates symlink (default false)
* `replSet`: replica set name (default not set)
*  shardsvr : run as a shard server (default false)
*  configsvr : run as a config server (default false)
* `smallfiles`: use smallfile allocation (default false)
* `journal`: use durable journaling (default true)
* `notablescan`: disables queries using fts (default true)
* `rest`: enable rest interface for monitoring (default true)
* `httpinterface`: enable http interface (default true)
* `auth`: enable authentication (default false)
* `user`: run mongodb as this user (default mongodb)
* `group`: run mongodb as this group (default mongodb)
* `backup`: do backup
* `backup_host`: where the backup goes over ssh
* `backup_port`: ssh port
* `backup_user`: user name for ssh
* `backup_path`: path to backup directory
* `backup_hour`: at what hour should the backup be started (default 2am)
* `backup_minute: at what minute should the backup be started (default 0)
* `backup_pubkey`: ssh pulic key for backup user
* `backup_privkey`: ssh private key for backup user


#### A mongodb instance with custom parameters:

```ruby
L7_mongo_db 'example' do
    port '27017'
    bind_ip '0.0.0.0'
    default_instance true
end
```

### Parameters for the `L7_mongo_s` provider

* `bind_ip`: listen address (default "127.0.0.1")
* `port`: listen port (default 27017)
* `configdb` : Connection string for communicating with config servers
* `localTreshold` : ping time (in ms) for a node to be considered local
* `auth`: enable authentication (default false)
* `user`: run mongos as this user (default mongos)
* `group`: run mongos as this group (default mongos)

#### An example mongos instance declaration

```ruby
L7_mongo_s 'example' do
    port '27017'
    bind_ip '0.0.0.0'
    configdb 'cfg/configdb.mongodbcluster0.example.com:27019'
end
```

## TODO


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2015/license.html).
* Copyright (c) 2015 Gabor Szelcsanyi

[![image](https://ga-beacon.appspot.com/UA-56493884-1/chef-mongo/README.md)](https://github.com/szelcsanyi/chef-mongo)
