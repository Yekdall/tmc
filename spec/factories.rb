FactoryGirl.define do

  #factory :user do |f|
  #  f.name                  "Benito Kamelas"
  #  f.email                 "benitok@example.com"
  #  f.password              "foobar"
  #  f.password_confirmation "foobar"
  #end

  # FactoryGirl can iterate and repeat as many times as requested by using the "sequence" method below:
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Random micropost number"
    user
  end

end