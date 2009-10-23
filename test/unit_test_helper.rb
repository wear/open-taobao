require 'rubygems'
require 'test/unit'
require 'open_taobao' 

#以下这段主要是为了使用第三方插件，如果使用gem安装了就不必要了。--deprecate
$:.unshift(File.dirname(__FILE__) + '/../lib')
rails_root = File.join(File.dirname(__FILE__),'..','..','..','..') 

if defined? RAILS_ROOT
  RAILS_ROOT.replace(rails_root)
else
  RAILS_ROOT = rails_root
end

require File.expand_path( RAILS_ROOT + "/config/environment")
# ===end
