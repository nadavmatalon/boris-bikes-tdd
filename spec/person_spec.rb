require "person"

describe Person do

	let(:person) { Person.new }

	it "initially has no bike" do
		expect(person.have_bike?).to be false
	end

	it "can have a bike" do
		person = Person.new(:bike)
		expect(person.have_bike?).to be true
	end

	it "can break the bike" do
		bike = double :bike    				
		person = Person.new(bike)
		expect(bike).to receive(:break)
		person.break_bike
	end

	it "can rent a bike from a statation" do
		station = double :station
		expect(station).to receive(:release_bike)
		person.rent_bike_from station
	end

	it "has a bike after renting one from station" do		
		station = double :station, release_bike: :bike
		# same as:
		# station = double :station
		# expect(station).to receive(:release_bike).and_return(:bike)
		
		# same as:
		# station = double(:station, {release_bike: :bike})

		person.rent_bike_from(station)
		expect(person.have_bike?).to be true
	end

	it "can return bike to station" do
		bike = Bike.new
		person = Person.new(bike)
		station = Station.new
		person.return_bike_to(station)
		expect(person.have_bike?).to be false
	end
end

