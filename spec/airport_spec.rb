require 'airport.rb'

describe Airport do

  it 'Checks an airport exists' do
    expect(subject).to equal subject
  end

  it 'Checks for the capacity of the airport to equal 12' do
    expect(subject.capacity).to eq 12
  end

  it 'Checks that the airport capacity can be changed if required' do
    airport = Airport.new(24)
    expect(airport.capacity).to eq 24
  end

end
