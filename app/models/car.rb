class Car < ApplicationRecord
  has_many :cars_sales
  has_many :countries, through: :cars_sales
end
