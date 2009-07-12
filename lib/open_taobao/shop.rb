module OpenTaobao
  module Shop
    class << self
      def get(fields_and_nick = {})
         pasted = OpenTaobao.pasted_params.merge({:method =>'taobao.shop.get'}).merge(fields_and_nick)
         RestClient.get OpenTaobao.generate_url(pasted)
      end
    end
    
    module Cart
      class << self
        def get_list(session = {})
         pasted = OpenTaobao.pasted_params.merge({:method =>'taobao.shopcats.list.get'}).merge(session)
         RestClient.get OpenTaobao.generate_url(pasted)
        end          
    end
    end
  end
end
