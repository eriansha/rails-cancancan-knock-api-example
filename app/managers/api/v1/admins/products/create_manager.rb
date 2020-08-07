module API
  module V1
    module Admins
      module Products
        class CreateManager

          def self.execute(
            name:,
            brand:,
            category:,
            colour:,
            condition:,
            price:,
            quantity:
          )
            Product.create!(
              name: name,
              brand: brand,
              category: category,
              colour: colour,
              condition: condition,
              price: price,
              quantity: quantity
            )
          end
          
        end
      end   
    end
  end
end
