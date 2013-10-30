FactoryGirl.define do

  factory :resource do
    sequence(:name) { |n| "Court #{n}"}
  end

  factory :booking do
    sequence(:start_time) { |n| DateTime.new(2013,10,n,10,0) }
    length 1
    resource_id 1
  end

end