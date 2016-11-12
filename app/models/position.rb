class Position < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  scope :coordinates, ->column, row {where column: column, row: row}

  scope :name_or_deskcode, ->search do
    joins(:user).where "users.name LIKE ? OR desk_code LIKE ?",
      "%#{search}%", "%#{search}%"
  end

  enum status: {disabled: 0, freedesk: 1, staff: 2, freespace: 3}

end
