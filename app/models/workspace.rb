class Workspace < ApplicationRecord
  has_many :positions, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.maximum.workspace.name}
  validates :description, presence: true,
    length: {maximum: Settings.maximum.workspace.description}
  validates_numericality_of :number_of_columns, presence: true,
    greater_than_or_equal_to: Settings.workspace_column
  validates_numericality_of :number_of_rows, presence: true,
    greater_than_or_equal_to: Settings.workspace_row

  before_create :create_positions

  scope :newest, ->{order created_at: :desc}

  private
  def create_positions
    column = self.number_of_columns
    row = self.number_of_rows
    for i in 1..column
      for j in 1..row
        self.positions.build column: i, row: j
      end
    end
  end
end
