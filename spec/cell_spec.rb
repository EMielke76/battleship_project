require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end 
  it 'exists' do

    expect(@cell).to be_a(Cell)
  end

  it 'has attributes' do

    expect(@cell.ship).to eq(nil)
  end
end
