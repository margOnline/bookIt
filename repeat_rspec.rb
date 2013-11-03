passed = true
repeat = ARGV[0].to_i
n = 0
success = []
failure = []
while (passed && n < repeat) do
  puts "Test number #{n + 1}"
  puts `rspec #{ARGV[1]}`
  passed = $?.success?

  if passed
    puts "Result: success"
    puts "==========================================================================="
    success << ''
  else
    puts "Result: failed"
    puts "==========================================================================="
    failure << ''
  end
  n += 1
end

if n >= repeat
  puts "Tests passed: #{success.count}"
  puts "Tests failed: #{failure.count}"
end

