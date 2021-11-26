require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Commit do
  subject { build(:github_commit) }

  describe '#id' do
    it 'returns id string' do
      expect(subject.id).to eq '2aaf96d6ca99f9a91f6a8158b034cc3ed3a12aae'
    end
  end

  describe '#tree_id' do
    it 'returns tree_id string' do
      expect(subject.tree_id).to eq 'a703d7f846433902b3c6ff1ecbd0f50f4480c39b'
    end
  end

  describe '#distinct' do
    it 'returns distinct boolean' do
      expect(subject.distinct).to eq true
    end
  end

  describe '#message' do
    it 'returns message string' do
      expect(subject.message).to eq 'Misc Gatsby README update'
    end
  end

  describe '#timestamp' do
    it 'returns date' do
      expect(subject.timestamp).to eq Date.parse('2021-04-26T07:20:53-06:00')
    end
  end

  describe '#author' do
    it 'returns author object' do
      expect(subject.author).to be_an_instance_of Github::Actor
    end
  end

  describe '#committer' do
    it 'returns committer object' do
      expect(subject.committer).to be_an_instance_of Github::Actor
    end
  end

  describe '#added' do
    it 'returns added array' do
      expect(subject.added).to be_an_instance_of Array
      expect(subject.added).to eq []
    end
  end

  describe '#removed' do
    it 'returns removed array' do
      expect(subject.removed).to be_an_instance_of Array
      expect(subject.removed).to eq []
    end
  end

  describe '#modified' do
    it 'returns modified array' do
      expect(subject.modified).to be_an_instance_of Array
      expect(subject.modified).to eq ['GATSBY-README.md', 'build-server/main.rb']
    end
  end
end
