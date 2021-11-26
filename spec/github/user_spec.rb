require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::User do
  subject { build(:github_user) }

  describe '#avatar_url' do
    it 'returns avatar_url string' do
      expect(subject.avatar_url).to eq 'https://avatars.githubusercontent.com/u/123456?v=4'
    end
  end

  describe '#email' do
    it 'returns email string' do
      expect(subject.email).to eq 'janedoe@example.com'
    end
  end

  describe '#events_url' do
    it 'returns events_url string' do
      expect(subject.events_url).to eq 'https://api.github.com/users/janedoe/events{/privacy}'
    end
  end

  describe '#followers_url' do
    it 'returns followers_url string' do
      expect(subject.followers_url).to eq 'https://api.github.com/users/janedoe/followers'
    end
  end

  describe '#following_url' do
    it 'returns following_url string' do
      expect(subject.following_url).to eq 'https://api.github.com/users/janedoe/following{/other_user}'
    end
  end

  describe '#gists_url' do
    it 'returns gists_url string' do
      expect(subject.gists_url).to eq 'https://api.github.com/users/janedoe/gists{/gist_id}'
    end
  end

  describe '#gravatar_id' do
    it 'returns gravatar_id string' do
      expect(subject.gravatar_id).to eq ''
    end
  end

  describe '#html_url' do
    it 'returns html_url string' do
      expect(subject.html_url).to eq 'https://github.com/janedoe'
    end
  end

  describe '#id' do
    it 'returns id integer' do
      expect(subject.id).to eq 123456
    end
  end

  describe '#login' do
    it 'returns login string' do
      expect(subject.login).to eq 'janedoe'
    end
  end

  describe '#name' do
    it 'returns name string' do
      expect(subject.name).to eq 'janedoe'
    end
  end

  describe '#node_id' do
    it 'returns node_id string' do
      expect(subject.node_id).to eq 'MDQ6VXNlcjc0Njc1OQ1b'
    end
  end

  describe '#organizations_url' do
    it 'returns organizations_url string' do
      expect(subject.organizations_url).to eq 'https://api.github.com/users/janedoe/orgs'
    end
  end

  describe '#site_admin' do
    it 'returns site admin boolean' do
      expect(subject.site_admin).to eq false
    end
  end

  describe '#starred_url' do
    it 'returns starred_url string' do
      expect(subject.starred_url).to eq 'https://api.github.com/users/janedoe/starred{/owner}{/repo}'
    end
  end

  describe '#subscriptions_url' do
    it 'returns subscriptions_url string' do
      expect(subject.subscriptions_url).to eq 'https://api.github.com/users/janedoe/subscriptions'
    end
  end

  describe '#received_events_url' do
    it 'returns received_events_url string' do
      expect(subject.received_events_url).to eq 'https://api.github.com/users/janedoe/received_events'
    end
  end

  describe '#repos_url' do
    it 'returns repos_url string' do
      expect(subject.repos_url).to eq 'https://api.github.com/users/janedoe/repos'
    end
  end

  describe '#type' do
    it 'returns type string' do
      expect(subject.type).to eq 'User'
    end
  end

  describe '#url' do
    it 'returns url string' do
      expect(subject.url).to eq 'https://api.github.com/users/janedoe'
    end
  end
end
