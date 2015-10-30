require 'rails_helper'

describe 'The post tagging process' do
  it 'Adds a tag to a new post' do
    test_tag = Tag.create(name: 'first tag')
    visit new_post_path
    fill_in 'Title', :with => 'test post'
    fill_in 'Content', :with => 'test content'
    check 'tags[first tag]'
    click_on 'Create Post'
    click_on 'test post'
    expect(page).to have_content 'first tag'
  end

  it 'Adds a tag to an existing post' do
    test_post = Post.create(title: "First post", content: "Just a test post for my new blog.")
    test_tag = Tag.create(name: 'first tag')
    visit post_path(test_post)
    click_on 'Edit Post'
    check 'tags[first tag]'
    click_on 'Update Post'
    expect(page).to have_content 'first tag'
  end

  it 'Deletes a tag from a post' do
    test_post = Post.create(title: "First post", content: "Just a test post for my new blog.")
    test_tag = Tag.create(name: 'first tag')
    test_post.tags.push(test_tag)
    visit post_path(test_post)
    click_on 'Edit Post'
    click_on 'Update Post'
    expect(page).not_to have_content 'first tag'
  end
end
