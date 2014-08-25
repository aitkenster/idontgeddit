class Post < ActiveRecord::Base
	has_many :comments
	has_many :upvotes
	has_many :downvotes
  belongs_to :user
	validates :title, presence: true,
            length: { minimum: 5 }

  def overall_votes
  	upvotes.count - downvotes.count
  end

#this method works calculates the difference between 
#when the post was created and 7:46:43am 8th Dec 2005
  def time_count
  	base_time = DateTime.new(2005, 12, 8, 07, 46, 43)
  	created_at.to_f - base_time.to_f
  end

  def hot_ranking
  		return 0 if overall_votes <= 0
  	 (Math.log10(overall_votes))+(time_count/45000)
  end

  def controversial_ranking
    return 0 if upvotes.count == 0 || downvotes.count == 0
    magnitude ** balance
  end

  def magnitude
    upvotes.count + downvotes.count
  end

  def balance
    if upvotes.count > downvotes.count
      downvotes.count.to_f/upvotes.count.to_f
    else
      upvotes.count.to_f/downvotes.count.to_f
    end
  end

  def rising_ranking
    time_weighting = (Time.now.to_f - created_at.to_f)/3600 + 1
    upvotes.count / time_weighting
  end

  def pluralize_votes
    overall_votes == 1 ? "vote" : "votes"
  end

end
