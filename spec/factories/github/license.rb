# Usage:
#
# github_license_attributes = attributes_for(:github_license)
# github_license = build(:github_license)
#
FactoryBot.define do

  factory :github_license, class: Github::License do
    initialize_with { new(attributes.stringify_keys) }

    key { 'mit' }
    name { 'MIT License' }
    spdx_id { 'MIT' }
    url { 'https://api.github.com/licenses/mit' }
    node_id { 'MDc6TGljZW5zZTEz' }
  end
end
