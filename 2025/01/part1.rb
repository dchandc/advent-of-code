#! /usr/bin/env ruby

def run(filename)
  instructions = File.readlines(filename, chomp: true)

  count = 0
  dial = 50

  instructions.each do |instruction|
    direction = instruction[0]
    amount = instruction[1..].to_i % 100

    if direction == 'L'
      dial -= amount
    elsif direction == 'R'
      dial += amount
    end

    if dial < 0
      dial += 100
    elsif dial >= 100
      dial -= 100
    end

    if dial.zero?
      count += 1
    end
  end

  count
end
