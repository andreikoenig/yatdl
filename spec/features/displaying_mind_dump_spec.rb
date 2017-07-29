require 'rails_helper'

RSpec.feature "Display existing tasks in mind dump" do
  scenario "a user visits mind dump page" do
    @task1 = Task.create(description: "Urgent Task", quadrant: "1")
    @task2 = Task.create(description: "Unassigned Task", quadrant: nil)

    visit "/"
    click_link "Mind Dump"

    expect(page).to have_content("List everything you have to do here.")
    expect(page).to have_content("#{@task1.description} (1)")
    expect(page).to have_content("#{@task2.description} (unassigned)")
  end

  scenario "a user creates a new task from mind dump page" do
    visit "/"
    click_link "Mind Dump"

    within("div.mind-dump") do
      fill_in "task_description", with: "Sample Mind Dump Task"
      click_button "Create Task"
    end

    expect(page.current_path).to eq(mind_dump_path)
    expect(page).to have_content("Sample Mind Dump Task (unassigned)")
  end
end
