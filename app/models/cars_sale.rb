class CarsSale < ApplicationRecord
  belongs_to :car
  belongs_to :country
end
