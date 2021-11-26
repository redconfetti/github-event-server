# Usage:
#
# github_commit_attributes = attributes_for(:github_commit)
# github_commit = build(:github_commit)
#
FactoryBot.define do

  factory :github_commit, class: Github::Commit do
    initialize_with { new(attributes.stringify_keys) }

    id { '2aaf96d6ca99f9a91f6a8158b034cc3ed3a12aae' }
    tree_id { 'a703d7f846433902b3c6ff1ecbd0f50f4480c39b' }
    distinct { true }
    message { 'Misc Gatsby README update' }
    timestamp { '2021-04-26T07:20:53-06:00' }
    url { 'https://github.com/redconfetti/com.redconfetti/commit/2aaf96d6ca99f9a91f6a8158b034cc3ed3a12aae' }

    author do
      attributes_for(:github_actor, {
        name: 'John Smith',
        email: 'jsmith@example.com',
        username: 'jsmith'
      }).stringify_keys
    end

    committer do
      attributes_for(:github_actor, {
        name: 'John Smith',
        email: 'jsmith@example.com',
        username: 'jsmith'
      }).stringify_keys
    end

    added { [] }
    removed { [] }
    modified { ['GATSBY-README.md', 'build-server/main.rb'] }
  end
end
