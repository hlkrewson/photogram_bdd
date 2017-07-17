require 'rails_helper'

#Create multiple posts using factories.
#User visits the root route
#User can see the comments and images of the posts we've created.

feature 'Index displays a list of posts' do
	
	scenario 'the index displays correct created post information' do
		user = create(:user)
		sign_in_with user

		post_one = create(:post, caption: "This is post one", user: user)
		post_two = create(:post, caption: "This is the second post", user: user)

		visit '/'
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end
