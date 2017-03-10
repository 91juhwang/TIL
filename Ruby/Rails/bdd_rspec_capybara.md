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

## Guard

Implementing automated testing using guard is very useful. 

### Installation & Configuration 
```ruby
gem `guard`
gem `guard-rspec`
gem `cucumber
```
then run 

  * `bundle install`
  * `bundle binstubs guard`
  * `guard init`

If I am building with Capybara/Rspec, Features that I build is going to be inside the features folder, which `Guard` is not automatically watching.
Therefore Make changes to the `Guardfile` above `watch rails.controller` line
```ruby
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { 'spec/features' }
  watch(%r{^app/models/(.+)\.rb$}) { 'spec/features' }
```
also add these as well to run the whole specs whenvever routes or views change. 
```ruby
  # Rails config changes
  watch(rails.routes)          { 'spec' } # run the whole spec folder whenever the routing changes

  # Capybara features specs
  watch(rails.view_dirs)     { 'spec/features' } # run the spec/features folder whenever the view changes
```

### Implementing user session using Warden provided by Devise
In order to use a method like `login_as` to mock a logged in user, we must implement Warden provided by Devise. 
You would have to manually write each steps for logging in if not using Devise.

  1. In the `rails_helper`
  2. `include Warden::Test::Helpers`
  3. Write tests

### Tips

  * In order to use `click_link` you must visit `_path` first. 