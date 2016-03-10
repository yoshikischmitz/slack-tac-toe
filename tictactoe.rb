# Written in an hour and then some for a URUG hack night.
class Game
  class Cell
  end

  class XCell < Cell
    def to_s
      "X"
    end
  end

  class OCell < Cell
    def to_s
      "O"
    end
  end

  class EmptyCell < Cell
    def to_s
      "▢"
    end
  end

  def initialize(x_user, o_user)
    @mapping = {x_user => XCell, o_user => OCell}
    @cells = 3.times.map{ 3.times.map{ EmptyCell.new } }
    @last_player = x_user
  end

  def place(x, y, user)
    return "Wait for your turn!" if user == @last_player
    case @cells[x][y]
    when nil
      "out of bounds"
    when EmptyCell
      @cells[x][y] = @mapping[user].new
      @last_player = user
      self.to_s
    when XCell
      "can't do that"
    when OCell
      "can't do that"
    end
  end

  def to_s
    @cells.map do |row|
      row.map(&:to_s).join("|")
    end.join("\n")
  end
end
