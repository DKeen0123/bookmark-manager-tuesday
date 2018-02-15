require 'link'

describe Link do
  it "has instance of Link class" do
    expect(described_class.all).to include Link
  end

  it 'adds a new link to the database' do
    described_class.add("http://www.facebook.com")
    expect(described_class.all.last.url).to eq "http://www.facebook.com"
  end

  it "checks the url is valid" do
    expect(described_class.valid?('feinwd')).to eq false
  end
end
