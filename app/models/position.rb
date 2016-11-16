class Position < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  enum status: {disabled: 0, freedesk: 1, staff: 2, freespace: 3}
end
