module RailsGeneralStuff

  def url_helpers
    Rails.application.routes.url_helpers
  end

  def json_response
    JSON.parse(response.body)
  end

end
