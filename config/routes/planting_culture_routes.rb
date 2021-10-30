module PlantingCultureRoutes
  def self.extended(router)
    router.instance_exec do
      if Rails.env.test? || Rails.env.development?
        controller :planting_cultures do
          get '/planting_cultures/possible-state-dates/:culture_name/:planting_date' => :possible_state_dates, as: :possible_state_dates
          # many routes would go here
        end
      end
    end
  end
end
