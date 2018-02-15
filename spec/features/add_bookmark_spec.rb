feature 'add bookmark' do
  scenario 'User can add a link to list of links' do
    add
    fill_in 'bookmark', with: 'http://www.reddit.com'
    fill_in 'title', with: 'Reddit'
    click_button 'Add Bookmark'
    expect(page).to have_content 'Reddit'
  end
end
