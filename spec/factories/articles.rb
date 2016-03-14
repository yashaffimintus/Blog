#require 'faker'
FactoryGirl.define do
  factory :article do |f|
    f.title "welcome"
    f.text  "hello world"
  end
  factory :invalid_article, parent: :article do |f|
  f.title nil
end

end