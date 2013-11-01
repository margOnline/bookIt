FactoryGirl.define do

  factory :resource do
    sequence(:name) { |n| "Court #{n}"}

  end

  factory :booking do
    sequence(:start_time) { |n| DateTime.new(2013,10,n,10,0) }
    # start_time DateTime.new(2013,10,9,0,0)
    length 1

    before :create do
      t = Time.local(2013,9,30,8,0,0)
      Timecop.travel(t)
    end
  end

end