require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Event do
  subject { build(:github_event) }

  describe '#before' do
    it 'returns before sha string' do
      expect(subject.before).to eq '2455cf546da95184ced72986041f03829ae17ced'
    end
  end

  describe '#branch' do
    it 'returns the branch name from ref' do
      expect(subject.branch).to eq 'main'
    end
  end

  describe '#after' do
    it 'returns after sha string' do
      expect(subject.after).to eq '057f81737d3c347bca08bcf58d20d3cd2158d760'
    end
  end

  describe '#description' do
    it 'returns description string' do
      expect(subject.description).to eq 'Source code for my personal blog'
    end
  end

  describe '#forced' do
    it 'returns forced boolean' do
      expect(subject.forced).to eq false
    end
  end

  describe '#html_url' do
    it 'returns html_url string' do
      expect(subject.html_url).to eq 'https://github.com/janedoe/com.janedoe'
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
