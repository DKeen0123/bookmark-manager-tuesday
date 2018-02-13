feature 'Add button' do
  scenario 'clicking the add button takes user to a form' do
    visit '/'
    click_button 'Add'
    expect(page).to have_content "Add new bookmark here"
  end
end
