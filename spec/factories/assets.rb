FactoryGirl.define do 
  factory :asset_type do |at|
    at.name 'Laptop'
  end
  factory :asset do |a|
    a.asset_id 'asset id'
    a.purchase_date Time.now
    a.serial_number '1234'
    a.make_year Time.now
    a.description 'This is description'
    a.display_size 15
    a.manufacturer 'HP'
    a.model 'TEST-123'
    a.operating_system 'Windows'
    a.asset_bounded 't' 
    association :asset_type, factory: :asset_type
  end

end
