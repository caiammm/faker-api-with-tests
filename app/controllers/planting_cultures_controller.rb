class PlantingCulturesController < ApplicationController

  def possible_state_dates
    culture_name_param = params[:culture_name]
    planting_date_param = Date.parse(params[:planting_date])


    response = {
      culture_name: culture_name_param,
      planting_date: planting_date_param.to_formatted_s(:db),
      possibilities: {
        accurate_identification_date: 'xx-xx-xxxx',
        senescence_date: 'xx-xx-xxxx',
        full_vegetation_date: 'xx-xx-xxxx',
        harvest_possibility_date: 'xx-xx-xxxx',
      }
    }

    render json: response
  end
end
