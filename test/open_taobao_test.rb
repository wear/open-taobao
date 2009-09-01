require 'rubygems'  
require 'open_taobao'
require 'open_taobao/shop'
require 'test/unit' 
require 'mocha'

$:.unshift(File.dirname(__FILE__) + '/../lib')
rails_root = File.join(File.dirname(__FILE__),'..','..','..','..') 

if defined? RAILS_ROOT
  RAILS_ROOT.replace(rails_root)
else
  RAILS_ROOT = rails_root
end

require File.expand_path( RAILS_ROOT + "/config/environment")


include OpenTaobao::Shop


class OpenTaobaoTest < Test::Unit::TestCase
  

  def test_sellercats
    result = OpenTaobao.get_with(:method =>'taobao.sellercats.list.get',:nick => 'alipublic23')
    puts result
  end


end
