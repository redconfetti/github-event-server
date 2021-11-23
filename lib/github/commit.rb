class Github::Commit
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def id
    data['id']
  end

  def tree_id
    data['tree_id']
  end

  def distinct
    data['distinct']
  end

  def message
    data['message']
  end

  def timestamp
    Date.parse(data['timestamp']) if data['timestamp']
  end

  def url
    data['url']
  end

  def author
    Github::Actor.new(data['author']) if data['author']
  end

  def committer
    Github::Actor.new(data['committer']) if data['committer']
  end

  def added
    data['added']
  end

  def removed
    data['removed']
  end

  def modified
    data['modified']
  end
end
