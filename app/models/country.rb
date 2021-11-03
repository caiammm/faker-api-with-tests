class Country < ApplicationRecord
  has_many :cars_sales
  has_many :cars, through: :cars_sales
end
