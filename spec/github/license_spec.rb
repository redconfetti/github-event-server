require "#{File.dirname(__FILE__)}/../spec_helper"

describe Github::License do
  let(:github_license_data) do
    {
      'key' => 'mit',
      'name' => 'MIT License',
      'spdx_id' => 'MIT',
      'url' => 'https://api.github.com/licenses/mit',
      'node_id' => 'MDc6TGljZW5zZTEz'
    }
  end
  subject { described_class.new(github_license_data) }

  describe '#key' do
    it 'returns key string' do
      expect(subject.key).to eq 'mit'
    end
  end

  describe '#name' do
    it 'returns name string' do
      expect(subject.name).to eq 'MIT License'
    end
  end

  describe '#spdx_id' do
    it 'returns spdx_id string' do
      expect(subject.spdx_id).to eq 'MIT'
    end
  end

  describe '#url' do
    it 'returns url string' do
      expect(subject.url).to eq 'https://api.github.com/licenses/mit'
    end
  end

  describe '#node_id' do
    it 'returns node_id string' do
      expect(subject.node_id).to eq 'MDc6TGljZW5zZTEz'
    end
  end
end
