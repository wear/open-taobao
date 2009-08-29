# Install hook code here
require 'fileutils'

#copy the taobao config file
taobao_config = File.dirname(__FILE__) + '/../../../config/taobao.yml'
unless File.exist?(taobao_config)
  FileUtils.copy(File.dirname(__FILE__) + '/taobao.yml',taobao_config)
end
