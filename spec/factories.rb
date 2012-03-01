Factory.define :user do |f|
  f.sequence(:username) { |n| "foo#{n}" }
  f.password "secret"
end