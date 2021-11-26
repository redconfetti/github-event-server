require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Actor do
  subject { build(:github_actor) }

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
