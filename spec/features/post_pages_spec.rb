require 'rails_helper'

describe 'add a new post process' do
  it 'adds a new post' do
    visit posts_path
    click_on 'Create Post'
    fill_in 'Title', :with => 'test post'
    fill_in 'Content', :with => 'test content'
    click_on 'Create Post'
    expect(page).to have_content 'test post'
  end

  it 'gives errors if required info is missing' do
    visit posts_path
    click_on 'Create Post'
    click_on 'Create Post'
    expect(page).to have_content 'Please fix'
  end
end

describe 'edit a post process' do
  it 'edits a post' do
    test_post = Post.create(title: "First post", content: "Just a test post for my new blog.")
    visit post_path(test_post)
    click_on 'Edit Post'
    fill_in 'Title', :with => 'Edited post'
    fill_in 'Content', :with => 'Edited content'
    expect(page).not_to have_content 'First post'
  end

  it 'gives errors if required info is missing' do
    test_post = Post.create(title: "First post", content: "Just a test post for my new blog.")
    visit post_path(test_post)
    click_on 'Edit Post'
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'Please fix'
  end
end

describe 'delete a post process' do
  it 'deletes a post' do
    test_post = Post.create(title: "First post", content: "Just a test post for my new blog.")
    visit post_path(test_post)
    click_on 'Delete Post'
    expect(page).not_to have_content 'First post'
  end
end
