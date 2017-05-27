require 'rails_helper'

RSpec.feature "Display tasks by quadrant" do
  before do
    @task_q1 = Task.create(description: "Urgent Task", quadrant: "1")
    @task_q2 = Task.create(description: "Important Task", quadrant: "2")
    @task_q3 = Task.create(description: "Annoying Task", quadrant: "3")
    @task_q4 = Task.create(description: "Time Wasting Task", quadrant: "4")
    @task_unassigned = Task.create(description: "Not Assigned Task", quadrant: nil)
  end

  scenario "user visits quadrant view page" do
    visit "/"
    expect(find("#quad1")).to have_content("Urgent Task")
    expect(find("#quad2")).to have_content("Important Task")
    expect(find("#quad3")).to have_content("Annoying Task")
    expect(find("#quad4")).to have_content("Time Wasting Task")
    expect(page).to_not have_content("Not Assigned Task")
  end
end
