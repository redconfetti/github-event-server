require 'yaml'

class Triggers
  attr_reader :data

  def self.all
    triggers = Psych.load_file(File.dirname(__FILE__) + "/../config/triggers.yml")
    triggers.collect {|t| self.new(t) }
  end

  def initialize(data)
    @data = data || {}
  end

  def repository_full_name
    data['repository_full_name']
  end

  def branch
    data['branch']
  end
end
