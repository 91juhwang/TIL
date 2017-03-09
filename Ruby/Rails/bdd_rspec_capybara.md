# BDD using Rspec & Capybara

## Basic work flow

  1. Create a feature branch 
  2. Write out the feature test
  3. Build the feature test to pass one by one
  4. when passes, merge it

## Feature test work flow

  1. Write out basic feature flows with expectations
  > Scenario: 
  > * Visit root page
  > * Click on new article
  > * Fill in title
  > * Fill in body
  > * Click a 'create article' button
  > 
  >
  > Expectations:
  > * Article has been created
  > * Redirect to articles path

  2. Convert rough draft flows to the feature test using capybara methods
  > ```ruby
  > require 'rails_helper'
  > 
  > RSpec.feature 'Creating articles' do
  >   scenario 'A user creates a new article' do
  >     visit root '/'
  >
  >     click_link 'New Article'
  >
  >     fill_in 'Title', with: 'Creating a blog'
  >     fill_in 'Body', with: 'Lorem Ipsum'
  >
  >     click_button 'Create Article'
  >     expect(page).to have_content('Article has been created')
  >     expect(page.current_path).to eq(articles_path)
  >   end
  > end
  > ```

  3. Run test and build each failure one by one to make it pass
  4. Repeat 3 until all feature passes
  5. Write next feature tests and merge the finished feature
