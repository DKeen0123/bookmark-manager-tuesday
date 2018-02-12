require 'manager'

describe Manager do
  subject(:manager) { described_class.new }

  it "initialises with an array of bookmarks" do
    expect(manager.bookmarks).to include "https://google.com"
  end


end
