require 'rails_helper'

describe 'add a new post process' do
  it 'adds a new post' do
    visit posts_path
    click_on 'create new'
    fill_in 'Title', :with => 'test post'
    fill_in 'Content', :with => 'test content'
    click_on 'Create Post'
    expect(page).to have_content 'test post'
  end

  it 'gives errors if required info is missing' do
    visit posts_path
    click_on 'create new'
    click_on 'Create Post'
    expect(page).to have_content 'Please fix'
  end
end
