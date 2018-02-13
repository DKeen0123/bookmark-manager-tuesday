feature 'Add button' do
  scenario 'clicking the add button takes user to a form' do
    add
    expect(page).to have_content "Add new bookmark here"
  end
end
