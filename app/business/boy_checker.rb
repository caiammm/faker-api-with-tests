class BoyChecker
  THE_REAL_BOYS = [
    "rafael",
    ""
  ]

  def initialize(name:)
    @name = name
  end

  def name_of_boy?
    return true if THE_REAL_BOYS.include?(@name)
    # fake logic here
    false
  end

  def json_response
    {
      name: @name,
      name_a_boy: name_of_boy?
    }
  end

end
