require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Actor do
  let(:github_actor_data) do
    {
      'name' => 'John Smith',
      'email' => 'johnsmith@example.com',
      'username' => 'johnsmith'
    }
  end
  subject { described_class.new(github_actor_data) }

  describe '#name' do
    it 'returns name string' do
      expect(subject.name).to eq 'John Smith'
    end
  end

  describe '#email' do
    it 'returns email string' do
      expect(subject.email).to eq 'johnsmith@example.com'
    end
  end

  describe '#username' do
    it 'returns username string' do
      expect(subject.username).to eq 'johnsmith'
    end
  end

end
