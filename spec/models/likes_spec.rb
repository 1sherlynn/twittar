require 'rails_helper'

RSpec.describe Like, type: :model do 

	describe 'associations' do 
		it { is_expected.to belong_to(:user) }
		it { is_expected.to belong_to(:tweet) }
	end 

	describe 'validations' do
  		it { is_expected.to validate_presence_of(:user_id) }
  		it { is_expected.to validate_presence_of(:tweet_id) }
	end 

	describe '#like' do 
		subject { Like.new(user_id: 1, tweet_id: 1) }
		it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
	end 

end 




