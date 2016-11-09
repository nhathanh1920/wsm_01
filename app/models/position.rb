class Position < ApplicationRecord
  belongs_to :workspace

  has_one :user

  enum status: {disabled: 0, freedesk: 1, staff: 2, freespace: 3}

  after_create :set_default

  def set_default
    self.freedesk!
  end
end
