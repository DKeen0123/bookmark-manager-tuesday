feature 'infrastructure working' do
  scenario 'displays "Welcome to Bookmark Manager"' do
    visit '/'
    expect(page).to have_content "Welcome to Bookmark Manager"
  end
end
