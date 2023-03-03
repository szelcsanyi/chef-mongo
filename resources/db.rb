#
# Cookbook Name:: L7-mongo
# Resources:: db
#
# Copyright 2015, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

actions :create, :remove

attribute :name, kind_of: String, name_attribute: true
attribute :cookbook, kind_of: String, default: 'L7-mongo'

attribute :url, kind_of: String, default: 'https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.1.tgz'
attribute :home, kind_of: String, default: '/opt'
attribute :bind_ip, kind_of: [String, Array], default: '127.0.0.1'
attribute :port, kind_of: [Integer, String], default: '27017'
attribute :default_instance, kind_of: [FalseClass, TrueClass], default: false
attribute :replSet, kind_of: [NilClass, String], default: nil
attribute :shardsvr, kind_of: [NilClass, FalseClass, TrueClass], default: nil
attribute :configsvr, kind_of: [NilClass, FalseClass, TrueClass], default: nil
attribute :notablescan, kind_of: [FalseClass, TrueClass], default: true
attribute :smallfiles, kind_of: [NilClass, FalseClass, TrueClass], default: nil
attribute :journal, kind_of: [FalseClass, TrueClass], default: true
attribute :rest, kind_of: [NilClass, FalseClass, TrueClass], default: nil
attribute :httpinterface, kind_of: [NilClass, FalseClass, TrueClass], default: nil
attribute :auth, kind_of: [FalseClass, TrueClass], default: false
attribute :user, kind_of: String, default: 'mongodb'
attribute :group, kind_of: String, default: 'mongodb'

attribute :backup, kind_of: [FalseClass, TrueClass], default: false
attribute :backup_host, kind_of: [String, NilClass], default: nil
attribute :backup_port, kind_of: [String, Integer, NilClass], default: 22
attribute :backup_user, kind_of: [String, NilClass], default: nil
attribute :backup_path, kind_of: [String, NilClass], default: nil
attribute :backup_hour, kind_of: [String, Integer, NilClass], default: 2
attribute :backup_minute, kind_of: [String, Integer, NilClass], default: 0
attribute :backup_pubkey, kind_of: [String, NilClass], default: nil
attribute :backup_privkey, kind_of: [String, NilClass], default: nil

def initialize(*args)
  super
  @action = :create
end
