# Install hook code here
require 'fileutils'
require 'rubygems'

dir = File.dirname(__FILE__)
config = File.join('config', 'taobao.yml')   

FileUtils.cp File.join('template', config), File.join(RAILS_ROOT, config) unless File.exist?(File.join(RAILS_ROOT, config))

puts IO.read(File.join(dir, 'README.rdoc'))
