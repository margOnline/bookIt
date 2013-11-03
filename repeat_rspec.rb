passed = true
n = 1
success = []
failure = []
while (passed && n < 11) do
  puts "Test number #{n}"
  puts `rspec #{ARGV[0]}`
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

if n >= 11
  puts "Tests passed: #{success.count}"
  puts "Tests failed: #{failure.count}"
end

