class Github::Repository
  attr_reader :data

  def initialize(data)
    @data = data || {}
  end

  def full_name
    data['full_name']
  end

  def name
    data['name']
  end

  def html_url
    data['html_url']
  end

  def description
    data['description']
  end

  def fork
    data['fork']
  end

  def url
    data['url']
  end

  def created_at
    Time.at(data['created_at']) if data['created_at']
  end

  def updated_at
    Date.parse(data['updated_at']) if data['updated_at']
  end

  def pushed_at
    Time.at(data['pushed_at']) if data['pushed_at']
  end

  def git_url
    data['git_url']
  end

  def ssh_url
    data['ssh_url']
  end

  def clone_url
    data['clone_url']
  end

  def svn_url
    data['svn_url']
  end

  def default_branch
    data['default_branch']
  end

  def master_branch
    data['master_branch']
  end
end
