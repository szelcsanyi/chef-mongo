maintainer       'Gabor Szelcsanyi'
maintainer_email 'szelcsanyi.gabor@gmail.com'
license          'MIT'
description      'Installs/Configures mongodb'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             'mongo'
version          '0.1.1'

%w( ubuntu debian ).each do |os|
  supports os
end
