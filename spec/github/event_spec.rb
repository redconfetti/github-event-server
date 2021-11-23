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
      'html_url' => 'https://github.com/janedoe/com.janedoe',
      'description' => 'Source code for my personal blog',
      'fork' => false,
      'url' => 'https://github.com/janedoe/com.janedoe',
      'forks_url' => 'https://api.github.com/repos/janedoe/com.janedoe/forks',
      'keys_url' => 'https://api.github.com/repos/janedoe/com.janedoe/keys{/key_id}',
      'collaborators_url' => 'https://api.github.com/repos/janedoe/com.janedoe/collaborators{/collaborator}',
      'teams_url' => 'https://api.github.com/repos/janedoe/com.janedoe/teams',
      'hooks_url' => 'https://api.github.com/repos/janedoe/com.janedoe/hooks',
      'issue_events_url' => 'https://api.github.com/repos/janedoe/com.janedoe/issues/events{/number}',
      'events_url' => 'https://api.github.com/repos/janedoe/com.janedoe/events',
      'assignees_url' => 'https://api.github.com/repos/janedoe/com.janedoe/assignees{/user}',
      'branches_url' => 'https://api.github.com/repos/janedoe/com.janedoe/branches{/branch}',
      'tags_url' => 'https://api.github.com/repos/janedoe/com.janedoe/tags',
      'blobs_url' => 'https://api.github.com/repos/janedoe/com.janedoe/git/blobs{/sha}',
      'git_tags_url' => 'https://api.github.com/repos/janedoe/com.janedoe/git/tags{/sha}',
      'git_refs_url' => 'https://api.github.com/repos/janedoe/com.janedoe/git/refs{/sha}',
      'trees_url' => 'https://api.github.com/repos/janedoe/com.janedoe/git/trees{/sha}',
      'statuses_url' => 'https://api.github.com/repos/janedoe/com.janedoe/statuses/{sha}',
      'languages_url' => 'https://api.github.com/repos/janedoe/com.janedoe/languages',
      'stargazers_url' => 'https://api.github.com/repos/janedoe/com.janedoe/stargazers',
      'contributors_url' => 'https://api.github.com/repos/janedoe/com.janedoe/contributors',
      'subscribers_url' => 'https://api.github.com/repos/janedoe/com.janedoe/subscribers',
      'subscription_url' => 'https://api.github.com/repos/janedoe/com.janedoe/subscription',
      'commits_url' => 'https://api.github.com/repos/janedoe/com.janedoe/commits{/sha}',
      'git_commits_url' => 'https://api.github.com/repos/janedoe/com.janedoe/git/commits{/sha}',
      'comments_url' => 'https://api.github.com/repos/janedoe/com.janedoe/comments{/number}',
      'issue_comment_url' => 'https://api.github.com/repos/janedoe/com.janedoe/issues/comments{/number}',
      'contents_url' => 'https://api.github.com/repos/janedoe/com.janedoe/contents/{+path}',
      'compare_url' => 'https://api.github.com/repos/janedoe/com.janedoe/compare/{base}...{head}',
      'merges_url' => 'https://api.github.com/repos/janedoe/com.janedoe/merges',
      'archive_url' => 'https://api.github.com/repos/janedoe/com.janedoe/{archive_format}{/ref}',
      'downloads_url' => 'https://api.github.com/repos/janedoe/com.janedoe/downloads',
      'issues_url' => 'https://api.github.com/repos/janedoe/com.janedoe/issues{/number}',
      'pulls_url' => 'https://api.github.com/repos/janedoe/com.janedoe/pulls{/number}',
      'milestones_url' => 'https://api.github.com/repos/janedoe/com.janedoe/milestones{/number}',
      'notifications_url' => 'https://api.github.com/repos/janedoe/com.janedoe/notifications{?since,all,participating}',
      'labels_url' => 'https://api.github.com/repos/janedoe/com.janedoe/labels{/name}',
      'releases_url' => 'https://api.github.com/repos/janedoe/com.janedoe/releases{/id}',
      'deployments_url' => 'https://api.github.com/repos/janedoe/com.janedoe/deployments',
      'created_at' => 1494606064,
      'updated_at' => '2021-04-26T05:22:00Z',
      'pushed_at' => 1619443258,
      'git_url' => 'git://github.com/janedoe/com.janedoe.git',
      'ssh_url' => 'git@github.com:janedoe/com.janedoe.git',
      'clone_url' => 'https://github.com/janedoe/com.janedoe.git',
      'svn_url' => 'https://github.com/janedoe/com.janedoe',
      'homepage' => nil,
      'size' => 3810,
      'stargazers_count' => 0,
      'watchers_count' => 0,
      'language' => 'Vim script',
      'has_issues' => true,
      'has_projects' => true,
      'has_downloads' => true,
      'has_wiki' => true,
      'has_pages' => false,
      'forks_count' => 0,
      'mirror_url' => nil,
      'archived' => false,
      'disabled' => false,
      'open_issues_count' => 0,
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
