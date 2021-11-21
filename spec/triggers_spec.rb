require "#{File.dirname(__FILE__)}/spec_helper"

describe Triggers do
  let(:trigger_data) do
    {
      'repository_full_name' => 'github/docs',
      'branch' => 'main'
    }
  end
  subject { described_class.new(trigger_data) }

  describe '#repository_full_name' do
    it 'returns full repository name' do
      expect(subject.repository_full_name).to eq 'github/docs'
    end
  end

  describe '#branch' do
    it 'returns branch string' do
      expect(subject.branch).to eq 'main'
    end
  end
end
