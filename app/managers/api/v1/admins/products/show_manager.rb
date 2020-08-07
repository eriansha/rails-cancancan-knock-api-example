module API
  module V1
    module Admins
      module Products
        class ShowManager

          def self.execute(id:)
            Product.find_by(id: id)
          end
          
        end
      end   
    end
  end
end
