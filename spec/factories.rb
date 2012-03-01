Factory.define :user do |f|
  f.sequence(:username) { |n| "dexter#{n}" }
  f.password "secret"
end