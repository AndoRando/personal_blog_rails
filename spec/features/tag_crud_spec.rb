require 'rails_helper'

describe 'add a new tag process' do
  it 'adds a new tag' do
    visit posts_path
    click_on 'Create Tag'
    fill_in 'Name', :with => 'test tag'
    click_on 'Create Tag'
    expect(page).to have_content 'test tag'
  end

  it 'gives errors if required info is missing' do
    visit posts_path
    click_on 'Create Tag'
    click_on 'Create Tag'
    expect(page).to have_content 'Please fix'
  end
end

describe 'edit a tag process' do
  it 'edits a tag' do
    test_tag = Tag.create(name: 'First Tag')
    visit tag_path(test_tag)
    click_on 'Edit'
    fill_in 'Name', :with => 'Edited tag'
    click_on 'Update Tag'
    expect(page).not_to have_content 'First tag'
  end

  it 'gives errors if required info is missing' do
    test_tag = Tag.create(name: 'First Tag')
    visit tag_path(test_tag)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Tag'
    expect(page).to have_content 'Please fix'
  end
end

describe 'delete a tag process' do
  it 'deletes a tag' do
    test_tag = Tag.create(name: 'First Tag')
    visit tag_path(test_tag)
    click_on 'Delete'
    expect(page).not_to have_content 'First tag'
  end
end
