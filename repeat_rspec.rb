passed = true
while passed do
  puts `rspec #{ARGV[0]}`
  passed = $?.success?
  puts "Result: #{(passed)? 'success' : 'failed'}"
end