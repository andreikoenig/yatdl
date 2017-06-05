require 'rails_helper'

RSpec.feature "Display all unassigned tasks" do
  before do
    @task1 = Task.create(description: "Urgent Task", quadrant: "1")
    @task2 = Task.create(description: "Need to be assigned task", quadrant: nil)
  end

  scenario "User visits Unassigned Tasks page" do
    visit "/"
    click_link "Unassigned Tasks"
    expect(page).to have_content("All your unassigned tasks here")
    expect(page).to have_content(@task2.description)
    expect(page).to_not have_content(@task1.description)
  end
end
