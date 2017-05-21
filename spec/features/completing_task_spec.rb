require 'rails_helper'

RSpec.feature 'Completing Tasks' do
  before do
    @task = Task.create(description: "Task Description", quadrant: nil)
  end

  scenario 'user completes task' do
    visit "/"
    expect(@task.time_completed).to eq(nil)
    click_link("complete_task_#{@task.id}")
    @task.reload
    expect(@task.time_completed).to_not eq(nil)
    expect(page).to have_content("Task completed")
    expect(page).to_not have_content("Task Description")
  end
end
