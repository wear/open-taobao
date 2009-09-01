# Include hook code here

require 'open_taobao' 
require 'open_taobao/shop'

taobao_config_file = File.dirname(__FILE__) + '/../../../config/taobao.yml'
TAOBAO = OpenTaobao.load_configuration(taobao_config_file)