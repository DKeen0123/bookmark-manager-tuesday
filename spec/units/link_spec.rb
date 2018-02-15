require 'link'

describe Link do
  it "has instance of Link class" do
    expect(described_class.all).to include Link
  end

  it 'adds a new link to the database' do
    described_class.add("http://www.facebook.com", "Facebook")
    expect(described_class.all.last.url).to eq "http://www.facebook.com"
  end

  it "checks the url is valid" do
    expect(described_class.valid?('feinwd')).to eq false
  end

  context '#delete' do
    it "deletes a link" do
      described_class.delete('Google')
      expect(described_class.all.first.title).not_to be 'Google'
    end
  end

  context '#update' do
    it "edits and updates already existing bookmarks" do
      described_class.update('Twitter', 'http://www.twitter.com', 'Reddit', 'http://www.reddit.com')
      expect(described_class.all.last.title).to eq 'Reddit'
    end
  end
end
