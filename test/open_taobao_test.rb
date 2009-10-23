require File.dirname(__FILE__) + '/unit_test_helper'

  # 测试环境:
  #      http://open.taobao.com/api_tool/api_test.html
  # api查询文档: 
  #        http://wiki.open.taobao.com/index.php/API文档
  #
  # API测试工具
  # http://open.taobao.com/api_tool/api_test.html?wikiApi=taobao.items.get

 
  # 注意:
  # 当API的访问级别为‘公开’时，session key不需要填写；
  # 
  # 当API的访问级别为‘须用户登录’时，session key必须填写；
  # 
  # 当API的访问级别为‘隐私数据须用户登录’时，session key可填可不填；
  # 
  # 如何获取session key，请看API测试工具使用指南
  # 
  # API测试工具使用指南地址:
  # http://wiki.open.taobao.com/index.php/API%E6%96%87%E6%A1%A3#API.E6.B5.8B.E8.AF.95.E5.B7.A5.E5.85.B7.E4.BD.BF.E7.94.A8.E6.8C.87.E5.8D.97


  # 测试环境下获取SessionKey
  # http://wiki.open.taobao.com/index.php/%E5%A6%82%E4%BD%95%E5%8F%96%E5%BE%97session%EF%BC%9F
  # 


class OpenTaobaoTest < Test::Unit::TestCase
   

  #店铺API
  # taobao.shopcats.list.get:获取前台展示的店铺类目
  # def test_taobao_shopcats_list_get
  #   result = OpenTaobao.get_with(:method => 'taobao.shopcats.list.get')
  #   puts result
  # end
  
  
  #taobao.sellercats.list.get:获取前台展示的店铺内卖家自定义商品类目
  # def test_taobao_sellercats_list_get
  #   result = OpenTaobao.get_with(:method =>'taobao.sellercats.list.get',:nick => 'alipublic01')
  #   puts result
  # end
  
  
  # taobao.sellercats.list.add:添加卖家自定义类目
  def test_taobao_sellercats_list_add
   session = "1574ce783ccf02ee523ac286d88dc570e"
   
   result = OpenTaobao.post_with(:method =>'taobao.sellercats.list.add',
                                 :name => "红酒22",
                                 :pict_url => "http://assets.taobaocdn.com/app/top/isv/logo.png",
                                 :parent_cid => "0",
                                 :sort_order => "1",
                                 :session => session
                                )
   
   puts result
  end

end
