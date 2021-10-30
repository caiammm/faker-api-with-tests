class BoyCheckerExternalService
  include HTTParty

  base_uri 'localhost:3010'

  def initialize(name:)
    @name = name
  end

  def is_a_boy?
    path = Rails.application.routes.url_helpers.is_boy_path(name: @name)
    # => {"name"=>"rafael", "name_a_boy"=>true}
    self.class.get(path)
  end

end
