# frozen_string_literal: true

FactoryBot.define do
  require 'faker'
  factory :poll do
    number { rand(10**5) }
    riding
    polling_location
  end

  factory :polling_location do
    title { Faker::Lorem.unique.word }
    address { Faker::Address.unique.street_address }
    city { Faker::Address.unique.city }
    postal_code do
      ['abceghjklmnprstvxy'.split('').sample, rand(9), 'abceghjnprstvz'.split('').sample, rand(9),
       'abceghjnprstvz'.split('').sample, rand(9)].join
    end
    riding
  end

  factory :riding do
    name  { Faker::Lorem.word }
    riding_code { rand(10**5) }
    province { %w[AB BC MB NB NL NT NS NU ON PE QC SK YT].sample }
  end
end
