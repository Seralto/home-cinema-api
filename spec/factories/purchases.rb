FactoryBot.define do
  factory :purchase do
    user
    purchase_option

    factory :invalid_purchase_user do
      user { nil }
    end

    factory :invalid_purchase_option_reference do
      purchase_option { nil }
    end
  end
end
