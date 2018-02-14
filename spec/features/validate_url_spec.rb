feature 'Validate URLs' do
  scenario 'It raises an error if its not a valid url' do
    add
    fill_in 'bookmark', with: 'efsdhis'
    click_button 'Add Bookmark'
    expect(page).to have_content "That is not a valid URL."
  end
end
