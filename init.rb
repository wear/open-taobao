# Include hook code here
taobao_config_file = "#{RAILS_ROOT}/config/taobao.yml"  

require 'open_taobao' 

TAOBAO = OpenTaobao.load_configuration(taobao_config_file)