FactoryGirl.define do
  factory :vivento_account do
    email "bla@bla.com"
    password "123123"
    password_confirmation "123123"
  end

  factory :vivento_account_no_email, class: ViventoAccount do
    password "123123"
    password_confirmation "123123"
  end
end