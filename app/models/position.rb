class Position < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  has_one :user

  enum status: {disabled: 0, freedesk: 1, staff: 2, freespace: 3}

  def update_status
    unless self.staff?
      self.update user_id: nil
    end
  end
end
