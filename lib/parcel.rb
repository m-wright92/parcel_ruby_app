class Parcel
  attr_reader :length, :width, :weight, :height, :id
  @@parcels = {}
  @@total_rows = 0

  def initialize(length, width, height, weight, id)
    @length = length
    @width = width
    @height = height
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values()
  end

  def delete
    @@parcels.delete(self.id)
  end

  def update(length, width, weight, height)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def ==(parcel_to_compare)
    self.id() == parcel_to_compare.id()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.length, self.width, self.height, self.weight, self.id)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def volume
    @volume = (@length * @width * @height)
  end

  def cost_to_ship
    volume
    cost = ((@weight * @volume) / 100)
  end
end