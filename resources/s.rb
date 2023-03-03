#
# Cookbook Name:: L7-mongo
# Resources:: s
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
attribute :configdb, kind_of: [NilClass, String], default: nil
attribute :localTreshold, kind_of: [NilClass, Integer, String], default: nil

attribute :auth, kind_of: [FalseClass, TrueClass], default: false
attribute :user, kind_of: String, default: 'mongos'
attribute :group, kind_of: String, default: 'mongos'

def initialize(*args)
  super
  @action = :create
end
