# Usage:
#
# github_user_attributes = attributes_for(:github_user)
# github_user = build(:github_user)
#
FactoryBot.define do

  factory :github_user, class: Github::User do
    initialize_with { new(attributes.stringify_keys) }

    name { 'janedoe' }
    email { 'janedoe@example.com' }
    login { 'janedoe' }
    id { 123456 }
    node_id { 'MDQ6VXNlcjc0Njc1OQ1b' }
    avatar_url { 'https://avatars.githubusercontent.com/u/123456?v=4' }
    gravatar_id { '' }
    url { 'https://api.github.com/users/janedoe' }
    html_url { 'https://github.com/janedoe' }
    followers_url { 'https://api.github.com/users/janedoe/followers' }
    following_url { 'https://api.github.com/users/janedoe/following{/other_user}' }
    gists_url { 'https://api.github.com/users/janedoe/gists{/gist_id}' }
    starred_url { 'https://api.github.com/users/janedoe/starred{/owner}{/repo}' }
    subscriptions_url { 'https://api.github.com/users/janedoe/subscriptions' }
    organizations_url { 'https://api.github.com/users/janedoe/orgs' }
    repos_url { 'https://api.github.com/users/janedoe/repos' }
    events_url { 'https://api.github.com/users/janedoe/events{/privacy}' }
    received_events_url { 'https://api.github.com/users/janedoe/received_events' }
    type { 'User' }
    site_admin { false }
  end
end
