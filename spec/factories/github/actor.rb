# Usage:
#
# github_actor_attributes = attributes_for(:github_actor)
# github_actor = build(:github_actor)
#
FactoryBot.define do

  factory :github_actor, class: Github::Actor do
    initialize_with { new(attributes.stringify_keys) }

    name { 'John Smith' }
    email { 'johnsmith@example.com' }
    username { 'johnsmith' }
  end
end
