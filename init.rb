# Include hook code here

require 'open_taobao' 

taobao_config_file = "#{RAILS_ROOT}/config/taobao.yml"
TAOBAO = OpenTaobao.load_configuration(taobao_config_file)