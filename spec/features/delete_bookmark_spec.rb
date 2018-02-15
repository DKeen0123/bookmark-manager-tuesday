feature 'delete a bookmark' do
  scenario "deletes a specified bookmark" do
    visit '/'
    click_button 'Delete'
    fill_in 'rm_bookmark', with: 'Google'
    click_button 'Submit'
    expect(page).to have_content 'Twitter'
    expect(page).not_to have_content 'Google'
  end
end
