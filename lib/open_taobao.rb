require 'digest/md5' 

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

        apply_configuration(@raw_taobao_configuration)
      end
    end
    
    def apply_configuration(config)
      ENV['TAOBAO_API_KEY']   = config['api_key'].to_s
      ENV['TAOBAO_SECRET_KEY']   = config['secret_key']

      @taobao_configuration = config
    end 
    
    def generate_url(pasted)
      case @taobao_configuration['host']
      when 'sandbox'
        "http://gw.api.tbsandbox.com/router/rest?" + url_params(pasted)
      when 'prod'
       # something
     end
    end
    
    def get_with(joined_params = {})
       pra = pasted_params.reverse_merge!(joined_params)
       parse_result RestClient.get(generate_url(pra))       
    end   
    
    def post_with(joined_params = {})
       pra = pasted_params.reverse_merge!(joined_params)
       parse_result RestClient.post(generate_url(pra),:content_type => 'text/plain; charset=UTF-8' )       
    end
    
    #支持中文
    def url_encode(str)
      return str.gsub!(/[^a-zA-Z0-9_\.\-]/n) {|x| x = format('%%%02x', x[0]) }
    end 

    def url_params(pasted)
      total_param = pasted.to_a.collect{|key,value| key.to_s+"="+value.to_s} + ["sign=#{generate_sign(pasted)}"]
      url_encode(total_param.join("&"))
    end

    def pasted_params
      {
        :app_key => @taobao_configuration['api_key'],
        :format=> @taobao_configuration['format'], 
        :v => @taobao_configuration['v'],
        :timestamp => timestamp,
      }
    end

    def generate_sign(pasted)
     Digest::MD5.hexdigest(@taobao_configuration['secret_key'] + pasted.to_s).upcase
    end
    
    def timestamp
      Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end 
    
    def parse_result(result)
      case @taobao_configuration['format']
      when 'xml'  
        Crack::XML.parse(result)['rsp'] || Crack::XML.parse(result)['error_rsp']
      when 'json'
        Crack::JSON.parse(result)
      end
    end
    
  end     

end