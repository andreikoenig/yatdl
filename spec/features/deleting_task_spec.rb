require 'rails_helper'

RSpec.feature 'Deleting Tasks' do
  before do
    @task = Task.create(description: "Task Description", quadrant: 3)
  end

  scenario 'user deletes task' do
    visit "/"
    expect { click_link("delete_task_#{@task.id}") }.to change(Task, :count).by(-1)
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Task has been deleted")
    expect(page).to_not have_content("Task Description")
  end
end
