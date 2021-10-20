require 'rails_helper'

RSpec.describe CarsController do
  describe 'GET #can_build' do
    context 'when a car can be built' do
      it 'returns an appropriate json response with status 200' do

        # mock the random part
        allow_any_instance_of(CarsController).to receive(:can_be_built?).with(model_number: "ELL-TORO").and_return(true)

        get url_helpers.car_can_be_built_path(model_number: "ELL-TORO")

        expected_json = {
          model_number: "ELL-TORO",
          can_be_built: true
        }

        expect(response.status).to eq(200)
        expect(json_response.symbolize_keys).to eq(expected_json)

        # test partially the json (hash)
        expect(json_response.symbolize_keys).to match(a_hash_including(can_be_built: true))

      end
    end
  end
end
