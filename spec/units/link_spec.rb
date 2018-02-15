require 'link'

describe Link do
  it "returns all of the links" do
    expect(described_class.all).to include 'http://www.google.com' && 'http://www.twitter.com'
  end

  it 'adds a new link to the database' do
    described_class.add("http://www.facebook.com")
    expect(described_class.all).to include 'http://www.facebook.com'
  end

  it "checks the url is valid" do
    expect(described_class.valid?('feinwd')).to eq false
  end
end
