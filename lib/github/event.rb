class Github::Event
  TYPES_SUPPORTED = ['push']

  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def after
    data['after']
  end

  def before
    data['before']
  end

  def description
    data['description']
  end

  def branch
    ref.gsub('refs/heads/', '')
  end

  def forced
    data['forced']
  end

  def html_url
    data['html_url']
  end

  def ref
    data['ref']
  end

  def owner
    if owner = data['owner']
      if owner['type'] == 'User'
        Github::User.new(owner)
      end
    end
  end

  def repository
    Github::Repository.new(data['repository']) if data['repository']
  end
end
