require_relative '../lib/pizzabot'

RSpec.describe "PizzaBot" do
  let(:pizzabot) { PizzaBot.new(neighborhood: neighborhood, locations: locations) }
  let(:neighborhood) { '5x5' }
  let(:locations) { "(1, 3) (4, 4)" }

  context 'when getting directions' do
    let(:get_directions) do
      pizzabot.get_directions(
        start_coord: start_coord,
        stop_coord: stop_coord
      )
    end

    context 'when delivery to north' do
      let(:start_coord) { [0,0] }
      let(:stop_coord) { [0,1] }

      it 'returns the N direction' do
        expect(get_directions).to eq('N')
      end
    end

    context 'when delivery to south' do
      let(:start_coord) { [0,1] }
      let(:stop_coord) { [0,0] }

      it 'returns the S direction' do
        expect(get_directions).to eq('S')
      end
    end

    context 'when delivery to east' do
      let(:start_coord) { [0,0] }
      let(:stop_coord) { [1,0] }

      it 'returns the E direction' do
        expect(get_directions).to eq('E')
      end
    end

    context 'when delivery to west' do
      let(:start_coord) { [1,0] }
      let(:stop_coord) { [0,0] }

      it 'returns the W direction' do
        expect(get_directions).to eq('W')
      end
    end
  end

  context 'when getting delivery instructions' do
    let(:delivery_instructions) do
      pizzabot.delivery_instructions
    end

    context 'when a location is out of range' do
      let(:locations) { "(1, 3) (4, 5)" }

      it 'returns bad location message' do
        expect(delivery_instructions).to eq('Sorry, Bad Location!')
      end
    end

    context 'when a proper instruction is given' do
      it 'returns the correct instructions' do
        expect(delivery_instructions).to eq('ENNNDEEEND')
      end
    end
  end
end
