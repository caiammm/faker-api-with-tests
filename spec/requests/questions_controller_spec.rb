require 'rails_helper'

RSpec.describe QuestionsController do
  describe 'GET #is_boy' do
    context 'when the param is a BOY' do
      it 'returns an appropriate json response with status 200' do

        # mock the random part
        param_for_test = "rafael"
        # allow_any_instance_of(QuestionsController).to receive(:name_of_boy?).with(name: param_for_test).and_return(false)

        get url_helpers.is_boy_path(name: param_for_test)

        expected_json = {
          name: param_for_test,
          name_a_boy: true
        }

        expect(response.status).to eq(200)
        expect(json_response.symbolize_keys).to eq(expected_json)

        # test partially the json (hash)
        expect(json_response.symbolize_keys).to match(a_hash_including(name_a_boy: true))

      end
    end
  end


  describe 'GET #is_boy_encripted' do
    context 'when the param is a BOY' do
      it 'returns an appropriate json response with status 200 and b64 encoded data' do

        # mock the random part
        param_for_test = "rafael"
        # allow_any_instance_of(BoyCheckerExternalService).to receive(:is_a_boy?).with(name: param_for_test).and_return(false)

        # allow_any_instance_of(BoyCheckerExternalService).to receive(:is_a_boy?).and_return({"name"=>"rafael", "name_a_boy"=>true})

        VCR.use_cassette("is_boy_encripted external service") do
          get url_helpers.is_boy_encripted_path(name: param_for_test)
        end

        # expected_json = { data: true }
        expected_json = {
          data: "eyJuYW1lIjoicmFmYWVsIiwibmFtZV9hX2JveSI6dHJ1ZX0=\n"
        }

        expect(response.status).to eq(200)
        expect(json_response.symbolize_keys).to eq(expected_json)
      end
    end
  end
end
