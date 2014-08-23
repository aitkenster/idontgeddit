# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyText"
    text "MyText"

	  factory :hot_post do 
	  	title "This is a hot post"
	  end

	  factory :not_hot_post do 
	  	title "This is not a hot post"
	  end
  end
end
