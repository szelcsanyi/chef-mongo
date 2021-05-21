#
# Cookbook Name:: L7-mongo
# Provider:: s
#
# Copyright 2016, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

def whyrun_supported?
  true
end

action :remove do
  service "mongos-#{new_resource.name}" do
    action [:stop, :disable]
  end

  directory "#{new_resource.home}/mongos-#{new_resource.name}" do
    action :delete
    recursive true
  end

  file "/etc/init.d/mongos-#{new_resource.name}" do
    action :delete
  end

  file "/etc/logrotate.d/mongos-#{new_resource.name}-logs" do
    action :delete
  end
end

action :create do
  Chef::Log.info("Mongos binary: #{new_resource.name}")

  base = "#{new_resource.home}/mongos-#{new_resource.name}"

  group new_resource.group do
    action :create
    system true
  end

  user new_resource.user do # ~FC021
    gid new_resource.group
    shell '/bin/false'
    home '/tmp'
    system true
    action :create
    only_if do
      ::File.readlines('/etc/passwd')
            .grep(/^#{Regexp.quote(new_resource.user)}/)
            .size <= 0
    end
  end

  directory base do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    recursive true
  end

  %w[etc data log var].each do |dirname|
    directory "#{base}/#{dirname}" do
      owner new_resource.user
      group new_resource.group
      mode '0750'
      action :create
      recursive false
    end
  end

  t = template "#{base}/etc/mongos.conf" do
    source 'etc/mongos.conf.erb'
    cookbook 'L7-mongo'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      name: new_resource.name,
      port: new_resource.port,
      configdb: new_resource.configdb,
      localTreshold: new_resource.localTreshold,
      bind_ip: new_resource.bind_ip,
      socket: base + '/var',
      pidfile: base + '/var/mongos.pid',
      log: base + '/log/mongos.log',
      auth: new_resource.auth
    )
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)

  %w[wget numactl pigz jq].each do |pkg|
    package pkg do
      action :install
    end
  end

  filename = ::File.basename(new_resource.url)
  dirname = filename.sub(/(\.tar\.gz$|\.tgz$)/, '')

  bash 'get_mongodb_binary' do
    user 'root'
    cwd base
    code <<-EOH
    wget --no-check-certificate #{new_resource.url}
    tar -zxf #{filename}
    EOH
    not_if do
      ::File.exist?(base + '/' + filename)
    end
  end

  link "#{base}/current" do
    to "#{base}/#{dirname}"
    link_type :symbolic
  end

  t = template "/etc/init.d/mongos-#{new_resource.name}" do
    source 'etc/init.d/mongos-init.erb'
    cookbook 'L7-mongo'
    owner 'root'
    group 'root'
    mode '0755'
    variables(
      daemon: "#{base}/current/bin/mongos",
      config: "#{base}/etc/mongos.conf",
      name: "mongos-#{new_resource.name}",
      pid: "#{base}/var/mongos.pid"
    )
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)

  service "mongos-#{new_resource.name}" do
    action :enable
    supports status: true, restart: true
  end

  t = template "/etc/logrotate.d/mongos-#{new_resource.name}-logs" do
    source 'etc/logrotate.d/mongos-logs.erb'
    cookbook 'L7-mongo'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      cpath: "#{base}/log"
    )
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)

  if new_resource.default_instance
    link '/usr/bin/mongo' do
      to "#{base}/current/bin/mongo"
      link_type :symbolic
    end
  end
end
