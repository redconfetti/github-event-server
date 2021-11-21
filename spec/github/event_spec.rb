require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Event do
  let(:github_event_data) do
    {
      'ref' => 'refs/heads/main',
      'before' => '2455cf546da95184ced72986041f03829ae17ced',
      'after' => '057f81737d3c347bca08bcf58d20d3cd2158d760',
      'repository' => {},
      'owner' => {
        'type' => 'User'
      },
      'forced' => false,
    }
  end
  subject { described_class.new(github_event_data) }

  describe '#before' do
    it 'returns before sha string' do
      expect(subject.before).to eq '2455cf546da95184ced72986041f03829ae17ced'
    end
  end

  describe '#after' do
    it 'returns after sha string' do
      expect(subject.after).to eq '057f81737d3c347bca08bcf58d20d3cd2158d760'
    end
  end

  describe '#forced' do
    it 'returns forced boolean' do
      expect(subject.forced).to eq false
    end
  end

  describe '#owner' do
    it 'returns user object' do
      expect(subject.owner).to be_an_instance_of Github::User
    end
  end

  describe '#ref' do
    it 'returns ref string' do
      expect(subject.ref).to eq 'refs/heads/main'
    end
  end

  describe '#repository' do
    it 'returns repository object' do
      expect(subject.repository).to be_an_instance_of Github::Repository
    end
  end
end
