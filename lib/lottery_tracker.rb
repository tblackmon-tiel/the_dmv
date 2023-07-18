class LotteryTracker
  attr_reader :dataset

  #get_all_numbers => array of arrays
  #winning_numbers_by_column => hash of hashes
  #most_likely_number => string
  def initialize(dataset)
    @dataset = dataset
  end

  def get_all_numbers
    @dataset.map do |draw|
      draw[:winning_numbers].split
    end
  end

  def winning_numbers_by_column(number_array)
    numbers_by_column = {
      column_1: number_array.map { |winning_numbers| winning_numbers[0] }.sort.tally,
      column_2: number_array.map { |winning_numbers| winning_numbers[1] }.sort.tally,
      column_3: number_array.map { |winning_numbers| winning_numbers[2] }.sort.tally,
      column_4: number_array.map { |winning_numbers| winning_numbers[3] }.sort.tally,
      column_5: number_array.map { |winning_numbers| winning_numbers[4] }.sort.tally,
      column_6: number_array.map { |winning_numbers| winning_numbers[5] }.sort.tally
    }
  end

  def most_likely_number
    most_likely_values = []
    numbers_by_column = winning_numbers_by_column(get_all_numbers)
    numbers_by_column.each do |column|
      most_likely_values << column[1].max_by {|key, value| value}
    end
    most_likely_values.map {|value| value[0]}.join(" ")
  end

  def most_likely_with_percent
    
  end
end