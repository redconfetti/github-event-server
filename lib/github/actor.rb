class Github::Actor
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def name
    data['name']
  end

  def email
    data['email']
  end

  def username
    data['username']
  end
end
