require 'spec_helper'
require 'turn_spec'
require 'script_spec'

RSpec.describe 'Boliche' do
  describe '#initialize' do
    it 'the code must create the variable' do
      newturn = Array.new(true)
      expect(newturn).to eq(0)
    end
  end
  describe '#ramdom_shots' do
    it 'the code must create the random number betwen 0 and 10' do
      allow_any_instance_of(Object).to receive(:rand).and_return(5)
      result = ramdoms_shots
      expect(result).to be_an(Integer).and be >= 0.and be <= 10
    end
    it 'the code must create a random number betwen 0 and 10 -first_shot' do
      allow_any_instance_of(Object).to receive(:rand).and_return(5)
      first_shot = 3
      resultado = randoms_shots(first_shot)
      expect(resultado).to be_an(Integer).and be >= 0.and be <= (10 -first_shot)
    end
    it 'the code addition the first and second shot' do
      allow_any_instance_of(Object).to receive(:rand).and_return(5,3)
      resultAdd = ramdoms_shots
      expect(resultAdd).to be_an(Array)
      points = resultAdd
      expect(points).to eq(8)
    end
  end
  describe '#fill_turns' do
    it 'the code fill the turn' do
      #validar
    end
  end
  describe '#display_turns' do
    it 'the code display the turn' do
    end
  end
end

