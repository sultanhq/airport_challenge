require 'plane.rb'

describe Plane do

  let(:weather) { double("weather", :check => "Sunny") }
  let(:airport) { double("airport", :planes => subject, :planes= => subject, :capacity => 12, :capacity= => 24, :full? => false) }

  it 'Check that an airplane exists?' do
    expect(subject).to eq subject
  end

  it 'Checks that plane is not landed' do
    expect(subject.landed).to be false
  end

  it 'Checks that a plane can land' do
    airport = Airport.new
    expect(subject.land(airport,weather)).to eq airport.planes
  end

  it 'Checks that a plane is not in airport once taken off' do
    airport = Airport.new
    subject.land(airport,weather)
    subject.take_off(airport,weather)
    expect(airport.planes).to be_empty
  end

  it 'Checks that a plane can take off from an airport if the weather is Sunny' do
    airport = Airport.new
    subject.land(airport,weather)
    expect(subject.take_off(airport,weather)).to eq subject
  end

  it 'Checks that a plane to land at an airport if the weather is bad' do
    airport = Airport.new
    weather = double("weather", :check => "Stormy")
    weather = weather.check
    expect{subject.land(airport,weather)}.to raise_error "Cannot land planes if the weather if stormy"
  end

  it 'Checks that a plane to take off from an airport if the weather is bad' do
    airport = Airport.new
    weather = double("weather", :check => "Stormy")
    subject.land(airport,weather)
    weather = weather.check
    expect{subject.take_off(airport, weather)}.to raise_error("Cannot take off in stormy weather")
  end

  it 'Checks that 12 planes can land at an airport' do
    airport = Airport.new
      12.times{(Plane.new).land(airport,weather)}
    expect(airport.planes.count).to eq 12
  end

  it 'Checks that more planes cannot land at an airport than its capacity' do
    airport = Airport.new
      12.times{(Plane.new).land(airport,weather)}
    expect{subject.land(airport,weather)}.to raise_error "Sorry, Airport is full, please fly to another"
  end

end

describe 'Edgecase Tests' do

    let(:weather) { double("weather", :check => "Sunny") }

    it 'Checks that the same plane cannot land twice' do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport, weather)
      expect{plane.land(airport, weather)}.to raise_error "This plane has already landed"
    end

    it 'Checks that the same plane cannot take off twice' do
      plane = Plane.new
      airport = Airport.new
      expect{plane.take_off(airport, weather)}.to raise_error "That plane is not in this airport"
    end

end
