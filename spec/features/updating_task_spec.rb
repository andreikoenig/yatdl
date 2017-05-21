require 'rails_helper'

RSpec.feature "Updating tasks" do
  before do
    @task = Task.create(description: "Task Description", quadrant: nil)
  end

  scenario "a user successfully updates task" do
    visit "/"
    click_link("edit_task_#{@task.id}")
    fill_in "task_description", with: "Updated Task Description"
    select "2", from: "task_quadrant"
    click_button "Update Task"
    expect(page).to have_content("Task updated")
    expect(page).to have_content("Updated Task Description")
    expect(page.current_path).to eq(root_path)
  end
end
