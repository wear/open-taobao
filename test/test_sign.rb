require File.dirname(__FILE__) + '/unit_test_helper'

# "app_key=12002791&format=json&method=taobao.shopcats.list.get&timestamp=2009-10-27%2012%3A04%3A55&v=1.0&sign=0F60CB5A9451989C9964ED5E67D843D9"


pasted = {:timestamp=>"2009-10-27 12:15:48", :method=>"taobao.shopcats.list.get", :format=>"json", :v=>1.0, :app_key=>12002791}

pasted_sort = pasted.sort{|a,b|a.to_s <=> b.to_s}

sign = OpenTaobao.generate_sign(pasted_sort)

puts  sign

# E6B0CEBF4A0E4C24B6D633D9B790E5BC
# http://gw.api.taobao.com/router/rest?app_key=12002791&format=json&method=taobao.shopcats.list.get
# &timestamp=2009-10-27%2012%3A15%3A48&v=1.0&sign=0F60CB5A9451989C9964ED5E67D843D9
# 



