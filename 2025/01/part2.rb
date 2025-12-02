#! /usr/bin/env ruby

def run(filename)
  instructions = File.readlines(filename, chomp: true)

  count = 0
  dial = 50

  instructions.each do |instruction|
    direction = instruction[0]
    num = instruction[1..].to_i

    full_rotations = num / 100
    count += full_rotations

    amount = num % 100
    original = dial
    if direction == 'L'
      dial -= amount
    elsif direction == 'R'
      dial += amount
    end

    if dial < 0
      dial += 100
      count += 1 unless original.zero?
    elsif dial >= 100
      dial -= 100
      count += 1
    elsif dial == 0
      count += 1
    end
  end

  count
end
