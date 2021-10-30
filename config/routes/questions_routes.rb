module QuestionsRoutes
  def self.extended(router)
    router.instance_exec do
      if Rails.env.test? || Rails.env.development?
        controller :questions do
          get '/questions/:name/is-boy' => :is_boy, as: :is_boy
          # many routes would go here
          get '/questions/encrypted/:name/is-boy' => :is_boy_encripted, as: :is_boy_encripted
        end
      end
    end
  end
end
