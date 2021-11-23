class Github::License
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def key
    data['key']
  end

  def name
    data['name']
  end

  def spdx_id
    data['spdx_id']
  end

  def url
    data['url']
  end

  def node_id
    data['node_id']
  end
end
