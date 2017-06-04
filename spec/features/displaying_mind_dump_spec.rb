require 'rails_helper'

RSpec.feature "Display existing tasks in mind dump" do
  before do
    @task1 = Task.create(description: "Urgent Task", quadrant: "1")
    @task2 = Task.create(description: "Unassigned Task", quadrant: nil)
  end

  scenario "a user visits mind dump page" do
    visit "/"
    click_link "Mind Dump"
    expect(page).to have_content("List everything you have to do here.")
    expect(page).to have_content("#{@task1.description} (1)")
    expect(page).to have_content("#{@task2.description} (unassigned)")
  end
end
