# get session here, http://open.taobao.com/isv/appTest.php?appkey=#{your_api_key}
# just set :session => params[:top_session]  if session needed

module OpenTaobao
  module Shop
    class << self 

      def get(pra = {})     
         pra.reverse_merge!(:method =>'taobao.shop.get')
         OpenTaobao.get_with(pra)
      end
      
      def update(pra = {})      
        pra.reverse_merge!(:method =>'taobao.shop.update')
        OpenTaobao.post_with(pra)
      end 
      
    end
    
    module Cart
      class << self         
        def get_list(pra = {})
          pra.reverse_merge!(:method =>'taobao.shopcats.list.get')  
          OpenTaobao.get_with(pra)
        end          
      end
    end
    
    module SellerCart
      class << self
        def get_list(pra = {})        
         pra.reverse_merge!(:method => 'taobao.sellercats.list.get')
         OpenTaobao.get_with(pra)
        end          
      end
    end
    
  end
end
