require_relative '../lib/pizzabot'

RSpec.describe "PizzaBotHelper" do
  let(:pizzabot_helper) { PizzaBotHelper }

  context '#dimensions_in_array' do
    let(:neighborhood) { '5x5' }
    let(:dimensions_in_array) { pizzabot_helper.dimensions_in_array(neighborhood) }

    it 'converts to neighborhood array' do
      expect(dimensions_in_array).to eq([5,5])
    end
  end

  context '#locations_in_array' do
    let(:locations) { '(1, 3) (4, 4)' }
    let(:locations_in_array) { pizzabot_helper.locations_in_array(locations) }

    it 'converts to list of locations' do
      expect(locations_in_array).to eq([[1,3], [4,4]])
    end
  end

  context '#horizontal_steps' do
    let(:horizontal_steps) { pizzabot_helper.horizontal_steps(start_x_coord: start_x, stop_x_coord: stop_x) }

    context 'when stop_x is higher than start_x' do
      let(:start_x) { 0 }
      let(:stop_x) { 2 }

      it { expect(horizontal_steps).to eq('EE') }
    end

    context 'when start_x is higher than stop_x' do
      let(:start_x) { 2 }
      let(:stop_x) { 0 }

      it { expect(horizontal_steps).to eq('WW') }
    end
  end

  context '#vertical_steps' do
    let(:vertical_steps) { pizzabot_helper.vertical_steps(start_y_coord: start_y, stop_y_coord: stop_y) }

    context 'when stop_y is higher than start_y' do
      let(:start_y) { 0 }
      let(:stop_y) { 2 }

      it { expect(vertical_steps).to eq('NN') }
    end

    context 'when start_y is higher than stop_y' do
      let(:start_y) { 2 }
      let(:stop_y) { 0 }

      it { expect(vertical_steps).to eq('SS') }
    end
  end

  context '#out_of_range?' do
    let(:neighborhood) { [5,5] }
    let(:out_of_range) { pizzabot_helper.out_of_range?(neighborhood, locations) }

    context 'when a location is out of range' do
      let(:locations) { [[1, 3], [4, 5]] }

      it { expect(out_of_range).to eq(true) }
    end

    context 'when all locations are in correct range' do
      let(:locations) { [[1, 3], [4, 4]] }

      it { expect(out_of_range).to eq(false) }
    end
  end
end
