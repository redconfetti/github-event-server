# Usage:
#
# github_repository_attributes = attributes_for(:github_repository)
# github_repository = build(:github_repository)
#
FactoryBot.define do

  factory :github_repository, class: Github::Repository do
    initialize_with { new(attributes.stringify_keys) }

    name { 'docs' }
    full_name { 'github/docs' }
    html_url { 'https://github.com/github/docs' }
    description { 'Documentation' }
    fork { false }
    url { 'https://github.com/github/docs' }
    created_at { 1494606064 }
    updated_at { '2021-04-26T05:22:00Z' }
    pushed_at { 1619443258 }
    git_url { 'git://github.com/github/docs.git' }
    ssh_url { 'git@github.com:github/docs.git' }
    clone_url { 'https://github.com/github/docs.git.git' }
    svn_url { 'https://github.com/github/docs' }
    default_branch { 'main' }
    master_branch { 'main' }
  end
end
