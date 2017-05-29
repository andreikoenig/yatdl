require 'rails_helper'

RSpec.feature "Creating Tasks" do
  scenario "a user creates a new task in quadrant 1" do
    visit "/"

    within("#quad1") do
      fill_in "task_description", with: "Sample Task 1"
      click_button "Create Task"
    end

    expect(find("#quad1")).to have_content("Sample Task 1")
    expect(page.current_path).to eq(root_path)
  end

  scenario "a user creates a new task in quadrant 2" do
    visit "/"

    within("#quad2") do
      fill_in "task_description", with: "Sample Task 2"
      click_button "Create Task"
    end

    expect(find("#quad2")).to have_content("Sample Task 2")
    expect(page.current_path).to eq(root_path)
  end

  scenario "a user creates a new task in quadrant 3" do
    visit "/"

    within("#quad3") do
      fill_in "task_description", with: "Sample Task 3"
      click_button "Create Task"
    end

    expect(find("#quad3")).to have_content("Sample Task 3")
    expect(page.current_path).to eq(root_path)
  end

  scenario "a user creates a new task in quadrant 4" do
    visit "/"

    within("#quad4") do
      fill_in "task_description", with: "Sample Task 4"
      click_button "Create Task"
    end

    expect(find("#quad4")).to have_content("Sample Task 4")
    expect(page.current_path).to eq(root_path)
  end
end
