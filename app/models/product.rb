class Product < ActiveRecord::Base

  enum category: {
    bag: 'bag',
    cloth: 'cloth',
    pants: 'pantes',
    shoes: 'shoes',
    make_up: 'make_up'
  }

  enum condition: {
    new_brand: 'new_brand',
    perfect: 'perfect',
    good: 'good'
  }
  
end
