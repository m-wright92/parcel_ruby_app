require 'pry'
require 'rspec'
require 'parcel'

describe '#parcel' do
  before(:each) do
    Parcel.clear()
  end  
  describe('.all') do
    it("returns an empty array when there are no parcels") do  
      expect(Parcel.all).to(eq([]))
    end
  end 
  describe('#save') do
    it("saves a parcel") do
      parcel = Parcel.new(5, 5, 10, nil)
      parcel.save()
      parcel2 = Parcel.new(3, 5, 8, nil)
      parcel2.save()
      expect(Parcel.all).to(eq([parcel,parcel2]))
    end
  end 
  describe('.clear') do
    it("clears all parcels") do
      parcel = Parcel.new(5, 5, 10, nil)
      parcel.save()
      parcel2 = Parcel.new(3, 5, 8, nil)
      parcel2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end
  end
  describe('.find') do
    it("finds an parcel by id") do
      parcel = Parcel.new(5, 5, 10, nil)
      parcel.save()
      parcel2 = Parcel.new(3, 5, 8, nil)
      parcel2.save()
      expect(Parcel.find(parcel.id)).to(eq(parcel))
    end
  end
  describe('#update') do
    it("updates an parcel by id") do
      parcel = Parcel.new(3, 5, 8, nil)
      parcel.save()
      parcel.update(7,7,12)
      expect(parcel.length).to(eq(7))
      expect(parcel.width).to(eq(7))
      expect(parcel.weight).to(eq(12))
    end
  end
  describe('#delete') do
    it("deletes a parcel by id") do
      parcel = Parcel.new(5, 5, 10, nil)
      parcel.save()
      parcel2 = Parcel.new(3, 5, 8, nil)
      parcel2.save()
      parcel.delete()
      expect(Parcel.all).to(eq([parcel2]))
    end
  end
end
