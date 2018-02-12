require 'link'

describe Link do
  it "returns all of the links" do
    expect(described_class.all).to include 'http://www.google.com'
  end
end
