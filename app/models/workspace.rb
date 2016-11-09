class Workspace < ApplicationRecord
  has_many :positions

  validates :name, presence: true, length: {maximum: 100}
  validates :number_of_columns, presence: true,
    numericality: {only_integer: true}
  validates :number_of_rows, presence: true, numericality: {only_integer: true}

  before_create :create_positions

  scope :newest, ->{order created_at: :desc}

  private
  def create_positions
    column1 = self.number_of_columns
    row1 = self.number_of_rows
    for i in 1..column1
      for j in 1..row1
        self.positions.build column: i, row: j
      end
    end
  end
end
