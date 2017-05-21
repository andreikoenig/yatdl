require 'rails_helper'

RSpec.feature "Creating Tasks" do
  scenario "a user creates a new task" do
    visit "/"
    fill_in "task_description", with: "Sample Task"
    select "2", from: "task_quadrant"
    click_button "Create Task"
    expect(page).to have_content("Sample Task(Q2)")
    expect(page.current_path).to eq(root_path)
  end
end
