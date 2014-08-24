# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "My Post Title"
    text "My Post Text"

	  factory :hot_post do 
	  	title "This is a hot post"
	  end

	  factory :not_hot_post do 
	  	title "This is not a hot post"
	  end

	  factory :controversial_post do 
	  	title "This is a controversial post"
	  end
  end
end
