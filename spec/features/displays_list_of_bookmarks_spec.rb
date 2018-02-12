feature 'displays list of bookmarks' do
  scenario 'user goes to homepage and sees their bookmarks' do
    visit '/'
    expect(page).to have_content "https://google.com"
  end
end
