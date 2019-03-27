FactoryBot.define do
  factory :purchase do
    date { Date.today }
    user
    purchase_option

    factory :invalid_purchase do
      date { nil }
    end

    factory :invalid_purchase_user do
      user { nil }
    end

    factory :invalid_purchase_option_reference do
      purchase_option { nil }
    end
  end
end
