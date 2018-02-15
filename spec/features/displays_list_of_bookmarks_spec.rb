feature 'displays list of bookmarks' do
  scenario 'user goes to homepage and sees their bookmarks' do
    visit '/'
    expect(page).to have_content "Google"
  end
end
