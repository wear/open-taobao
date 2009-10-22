$:.unshift(File.dirname(__FILE__) + '/../lib')

require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")

require 'open_taobao'
require 'open_taobao/shop'
require 'test/unit'

include OpenTaobao::Shop


class OpenTaobaoTest < Test::Unit::TestCase

  def test_sellercats
    result=OpenTaobao.get_with(:method =>'taobao.sellercats.list.get',:nick => 'alipublic23')
    puts result
  end
  
  def test_init
    
  end
  
  
end
