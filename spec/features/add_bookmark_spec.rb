feature 'add bookmark' do
  scenario 'User can add a link to list of links' do
    add
    fill_in 'bookmark', with: 'http://www.reddit.com'
    click_button 'Add Bookmark'
    expect(page).to have_content 'http://www.reddit.com'
  end
end
