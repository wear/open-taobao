# OpenTaobao
module OpenTaobao               
  
  @raw_taobao_configuration = {}
  @taobao_configuration = {}
  
  class << self
    def load_configuration(taobao_yaml_file)
      if File.exist?(taobao_yaml_file)
        @raw_taobao_configuration = YAML.load(ERB.new(File.read(taobao_yaml_file)).result)
        if defined? RAILS_ENV
          @raw_taobao_configuration = @raw_taobao_configuration[RAILS_ENV]
        end
       # Thread.current[:fb_api_config] = @raw_taobao_configuration unless Thread.current[:fb_api_config]
        apply_configuration(@raw_taobao_configuration)
      end
    end
    
    def apply_configuration(config)
      ENV['TAOBAO_API_KEY']   = config['api_key'].to_s
      ENV['TAOBAO_SECRET_KEY']   = config['secret_key']

      @taobao_configuration = config
    end 
    
    def generate_url(pasted)
      "http://gw.sandbox.taobao.com/router/rest?" + url_params(pasted)
    end
    
    
    def url_encode(str)
    	return str.gsub!(/[^\w$&\-+.,\/:;=?@]/) { |x| x = format("%%%x", x[0])}
    end 

    def url_params(pasted)
      total_param = pasted.to_a.collect{|key,value| key.to_s+"="+value} + ["sign=#{generate_sign(pasted)}"]
      url_encode  total_param.join("&")
    end

    def pasted_params
      {
        :app_key => @taobao_configuration['api_key'].to_s ,
      #  :method =>'taobao.shop.get',
        :format=> @taobao_configuration['format'], 
        :v => @taobao_configuration['v'].to_s,
        :timestamp => timestamp,
     #   :fields =>'sid,cid,nick,title,desc,bulletin,pic_path,created,modified',
     #   :nick => 'alipublic05'
      }
    end

    def generate_sign(pasted)
     #  Digest::MD5.hexdigest("716be49fa01c839b302abc2ef40e3f56" + generate_params.to_s).upcase
     Digest::MD5.hexdigest(@taobao_configuration['secret_key'] + pasted.to_s).upcase
    end
    
    def timestamp
      Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
    
  end     

end