class QuestionsController < ApplicationController

  def is_boy
    name_param = params[:name]

    is_a_boy = name_of_boy?(name: name_param)

    response = {
      name: name_param,
      name_a_boy: is_a_boy
    }

    render json: response
  end

  def is_boy_encripted
    name_param = params[:name]
    external_service_response = BoyCheckerExternalService.new(name: name_param).is_a_boy?
    # {"name"=>"rafael", "name_a_boy"=>true}
    b64_encoded_response = Base64.encode64(external_service_response.to_json)
    # response = { data: true }

    render json: { data: b64_encoded_response }

    # pega a resposta de is_boy acima como um serviço externo
    # encripta em b64 e devolve: { data: b64_response }
  end

  private def name_of_boy?(name:)
    return true if BoyChecker::THE_REAL_BOYS.include?(name)
    # fake logic here
    false
  end
end
