require "#{File.dirname(__FILE__)}/spec_helper"

describe 'profile' do
  let(:profile) { Profile.new }

  it 'it has a name' do
    expect(profile).to be_an_instance_of Profile
    expect(profile.name).to eq 'John Doe'
  end
end
