Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  controller :cars do
    get '/cars/:model_number/car_can_be_built-' => :can_be_built, as: :car_can_be_built
  end
end
