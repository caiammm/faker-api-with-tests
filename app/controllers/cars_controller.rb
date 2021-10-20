class CarsController < ApplicationController

  def can_be_built
    param_model_number = params[:model_number]

    random_boolean = can_be_built?(model_number: param_model_number)

    response = {
      model_number: param_model_number,
      can_be_built: random_boolean
    }

    render json: response
  end

  private def can_be_built?(model_number:)
    # fake logic here
    [true, false].sample
  end
end
