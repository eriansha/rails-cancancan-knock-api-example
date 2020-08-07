module API
  module V1
    module Admins
      module Products
        class FilterManager

          def self.execute
            Product.all
          end
          
        end
      end   
    end
  end
end
