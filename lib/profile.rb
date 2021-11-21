class Profile

  def self.all
    [Profile.new]
  end

  def id
    1
  end

  def name
    'John Doe'
  end

  def created_at
    Date.now
  end

  def updated_at
    Date.now
  end

  def as_json(options={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at,
    }
  end
end
