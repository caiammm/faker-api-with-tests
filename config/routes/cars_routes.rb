module CarsRoutes
  def self.extended(router)
    router.instance_exec do
      if Rails.env.test? || Rails.env.development?
        controller :cars do
          get '/cars/:model_number/car_can_be_built-' => :can_be_built, as: :car_can_be_built
          # many others cars routes would go here
        end
      end
    end
  end
end
