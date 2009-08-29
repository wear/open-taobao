$:.unshift(File.dirname(__FILE__) + '/../lib')

require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")

require 'open_taobao'
require 'test/unit'

include 'OpenTaobao::Shop'


class OpenTaobaoTest < Test::Unit::TestCase
  
  test "sellercats.list.get " do 
   result=OpenTaobao.get_with(:method =>'taobao.sellercats.list.get',:nick => 'alipublic23')  
   assert result
  end
  # Replace this with your real tests.
  # test "the truth" do
  #   assert true
  # end
end
