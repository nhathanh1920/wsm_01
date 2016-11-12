module PositionsHelper
  def check_status position
    case
    when position.disabled?
      if position.name == "flower"
        "flower.png"
      elsif position.name == "bin"
        "bin.png"
      else
        "wall.png"
      end
    when position.freedesk?
      "freedesk.png"
    when position.staff?
      "staff.png"
    else
      "freespace.jpg"
    end
  end
end
