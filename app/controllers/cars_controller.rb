class CarsController < ApplicationController

  def can_be_built
    random_boolean = [true, false].sample

    response = {
      model_number: params[:model_number],
      can_be_built: true
    }

    render json: response
  end
end
