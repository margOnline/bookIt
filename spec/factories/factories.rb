FactoryGirl.define do

  factory :resource do
    sequence(:name) { |n| "Court #{n}"}

  end

  factory :booking do
    sequence(:start_time) { |n| DateTime.new(2013,10,30,9,0,0) }
    length 1
    resource

    before :create do
      t = Time.local(2013,9,30,8,0,0)
      Timecop.travel(t)
    end
  end

end