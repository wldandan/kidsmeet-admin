FactoryGirl.define do
  factory :a do
    location_uuid    { FactoryGirl.create(:location).location_uuid }
    price            { BigDecimal(rand(100.0..2000).to_s).round(6) }
    effective_from   { Time.now.to_s }

    factory :published_list_price do
      status         { ListPrice.statuses[:published] }
    end
  end
end
