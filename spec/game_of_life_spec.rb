require_relative '../lib/game_of_life' # Adjust the path as needed

describe GameOfLife do
  context 'with an initial configuration' do
    before do
      @initial_generation = [
        ['O', 'X', 'X'],
        ['X', 'O', 'O'],
        ['O', 'O', 'X']
      ]
      @game = GameOfLife.new(@initial_generation)
    end

    describe '#next_generation' do
      it 'should calculate the next generation correctly for the provided initial configuration' do
        expected_next_gen = [
          ['X', 'O', 'X'],
          ['X', 'X', 'O'],
          ['O', 'O', 'O']
        ]

        @game.make_next_generation
        expect(@game.current_generation).to eq(expected_next_gen)
      end

      it 'should handle a grid with all cells alive' do
        all_alive = [
          ['O', 'O', 'O'],
          ['O', 'O', 'O'],
          ['O', 'O', 'O']
        ]

        @game = GameOfLife.new(all_alive)
        expected_next_gen = [
          ['O', 'X', 'O'],
          ['X', 'X', 'X'],
          ['O', 'X', 'O']
        ]

        @game.make_next_generation
        expect(@game.current_generation).to eq(expected_next_gen)
      end

      it 'should handle the pattern of a grid with three cells alive' do
        three_alive = [
          ['X', 'O', 'X'],
          ['X', 'O', 'X'],
          ['X', 'O', 'X']
        ]
        @game = GameOfLife.new(three_alive)
        expected_next_gen = [
          ['X', 'X', 'X'],
          ['O', 'O', 'O'],
          ['X', 'X', 'X']
        ]

        @game.make_next_generation
        expect(@game.current_generation).to eq(expected_next_gen)
      end
    end
  end
end
