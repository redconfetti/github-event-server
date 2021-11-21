require "#{File.dirname(__FILE__)}/spec_helper"

describe SiteBuilder do
  let(:event) do
    {}
  end
  subject { described_class.new(event) }
end
