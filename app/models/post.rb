class Post < ActiveRecord::Base
	has_many :comments
	has_many :upvotes
	has_many :downvotes
	validates :title, presence: true,
            length: { minimum: 5 }

  def overall_votes
  	upvotes.count - downvotes.count
  end

#this method works calculates the difference between 
#when the post was created and 7:46:43am 8th Dec 2005
  def time_count
  	base_time = DateTime.new(2005, 12, 8, 07, 46, 43)
  	TimeDifference.between(base_time, created_at).in_seconds
  end

  def ranking
  		return 0 if overall_votes <= 0
  	 (Math.log10(overall_votes))+(time_count/45000)
  end

end
