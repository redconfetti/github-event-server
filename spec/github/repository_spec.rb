require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::Repository do
  let(:github_repository_data) do
    {
      'name' => 'docs',
      'full_name' => 'github/docs',
      'html_url' => 'https://github.com/github/docs',
      'description' => 'Documentation',
      'fork' => false,
      'url' => 'https://github.com/github/docs',
      'created_at' => 1494606064,
      'updated_at' => '2021-04-26T05:22:00Z',
      'pushed_at' => 1619443258,
      'git_url' => 'git://github.com/github/docs.git',
      'ssh_url' => 'git@github.com:github/docs.git',
      'clone_url' => 'https://github.com/github/docs.git.git',
      'svn_url' => 'https://github.com/github/docs',
      'default_branch' => 'main',
      'master_branch' => 'main'
    }
  end
  subject { described_class.new(github_repository_data) }

  describe '#name' do
    it 'returns name string' do
      expect(subject.name).to eq 'docs'
    end
  end

  describe '#html_url' do
    it 'returns html url string' do
      expect(subject.html_url).to eq 'https://github.com/github/docs'
    end
  end

  describe '#description' do
    it 'returns description string' do
      expect(subject.description).to eq 'Documentation'
    end
  end

  describe '#fork' do
    it 'returns fork boolean' do
      expect(subject.fork).to eq false
    end
  end

  describe '#url' do
    it 'returns url string' do
      expect(subject.url).to eq 'https://github.com/github/docs'
    end
  end

  describe '#created_at' do
    it 'returns created at date' do
      expect(subject.created_at).to eq Time.at(1494606064)
    end
  end

  describe '#pushed_at' do
    it 'returns pushed at date' do
      expect(subject.pushed_at).to eq Time.at(1619443258)
    end
  end

  describe '#updated_at' do
    it 'returns updated at date' do
      expect(subject.updated_at).to eq Date.parse('2021-04-26T05:22:00Z')
    end
  end

  describe '#description' do
    it 'returns description string' do
      expect(subject.description).to eq 'Documentation'
    end
  end

  describe '#git_url' do
    it 'returns git url string' do
      expect(subject.git_url).to eq 'git://github.com/github/docs.git'
    end
  end

  describe '#ssh_url' do
    it 'returns ssh url string' do
      expect(subject.ssh_url).to eq 'git@github.com:github/docs.git'
    end
  end

  describe '#clone_url' do
    it 'returns clone url string' do
      expect(subject.clone_url).to eq 'https://github.com/github/docs.git.git'
    end
  end

  describe '#svn_url' do
    it 'returns svn url string' do
      expect(subject.svn_url).to eq 'https://github.com/github/docs'
    end
  end

  describe '#default_branch' do
    it 'returns default branch string' do
      expect(subject.default_branch).to eq 'main'
    end
  end

  describe '#master_branch' do
    it 'returns master branch string' do
      expect(subject.master_branch).to eq 'main'
    end
  end
end
