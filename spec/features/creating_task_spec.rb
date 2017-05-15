require 'rails_helper'

RSpec.feature "Creating Tasks" do
  scenario "a user creates a new task" do
    visit "/"
    fill_in "task_description", with: "Sample Task"
    click_button "Create Task"
    expect(page).to have_content("Sample Task")
    expect(page.current_path).to eq(root_path)
  end
end
