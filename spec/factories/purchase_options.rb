FactoryBot.define do
  factory :purchase_option do
    price { Faker::Number.decimal }
    quality { %w(HD SD).sample }
    content

    factory :invalid_purchase_option do
      price { nil }
    end

    factory :invalid_purchase_option_content do
      content { nil }
    end
  end
end
