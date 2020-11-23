require 'rails_helper'

describe 'navigate' do
    before do
        @post = Post.create(title: "My post", description: "Post description")
    end
    
    it 'loads the show page' do
        visit "/posts/#{@post.id}"
        expect(page.status_code).to eq(200)
    end

    it 'shows the title on the show page in an h1 tag' do
        visit "/posts/#{@post.id}"
        expect(page).to have_css("h1", text: "My post")
    end

    it 'shows the description on the show page in a p tag' do
        visit "/posts/#{@post.id}"
        expect(page).to have_css("p", text: "Post description")
    end
end

# make sure specs are in features folder or they will have NoMethod errors