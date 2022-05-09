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
end
