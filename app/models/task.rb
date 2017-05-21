class Task < ApplicationRecord
  validates :description, presence: true

  def complete!
    update_attribute(:time_completed, Time.now)
  end
end
