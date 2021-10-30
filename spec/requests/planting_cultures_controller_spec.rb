require 'rails_helper'

RSpec.describe PlantingCulturesController do
  describe 'GET #possible_state_dates' do
    context 'when the params are valid' do
      it 'returns an appropriate json response with status 200' do
        route_test_params = {
          culture_name: "batata", 
          planting_date: "2020-05-10"
        }

        get url_helpers.possible_state_dates_path(route_test_params)

        expected_json = {
          culture_name: route_test_params[:culture_name],
          planting_date: route_test_params[:planting_date],
          possibilities: {
            accurate_identification_date: 'xx-xx-xxxx',
            senescence_date: 'xx-xx-xxxx',
            full_vegetation_date: 'xx-xx-xxxx',
            harvest_possibility_date: 'xx-xx-xxxx',
          }
        }

        expect(response.status).to eq(200)
        expect(json_response.deep_symbolize_keys).to eq(expected_json)
      end
    end
  end
end
