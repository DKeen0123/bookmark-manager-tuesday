feature 'Update bookmark' do
  scenario 'Updates bookmark title and link' do
    visit '/'
    click_button 'Edit Google'
    fill_in 'new_title', with: 'Reddit'
    fill_in 'new_url', with: 'http://www.reddit.com'
    click_button 'Submit'
    expect(page).to have_content 'Reddit'
    expect(page).not_to have_content 'Google'
  end
end
