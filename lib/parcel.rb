class Parcel
  attr_reader :length, :width, :weight
  @@parcels = {}
  @@total_rows = 0

  def initialize(length, width, weight, id)
    @length = length
    @width = width
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values()
  end

  def delete
    @@parcels.delete(self.id)
  end

  def update(length, width, weight)
    @length = length
    @width = width
    @weight = weight
  end

  def save
    @@parcels[self.id] = Parcel.new(self.length, self.width, self.weight, self.id)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end
end