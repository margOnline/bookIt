FactoryGirl.define do

  factory :resource do
    name 'Centre court'
  end

  factory :booking do
    start_time = DateTime.new(2013,10,30,9,9,9)
    length = 1
  end

end