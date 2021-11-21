class Github::User
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

  def login
    data['login']
  end

  def id
    data['id']
  end

  def node_id
    data['node_id']
  end

  def avatar_url
    data['avatar_url']
  end

  def gravatar_id
    data['gravatar_id']
  end

  def url
    data['url']
  end

  def html_url
    data['html_url']
  end

  def followers_url
    data['followers_url']
  end

  def following_url
    data['following_url']
  end

  def gists_url
    data['gists_url']
  end

  def starred_url
    data['starred_url']
  end

  def subscriptions_url
    data['subscriptions_url']
  end

  def organizations_url
    data['organizations_url']
  end

  def repos_url
    data['repos_url']
  end

  def events_url
    data['events_url']
  end

  def received_events_url
    data['received_events_url']
  end

  def type
    data['type']
  end

  def site_admin
    data['site_admin']
  end
end
