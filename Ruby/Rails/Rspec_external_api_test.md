# RSpec

## Testing external apis

```ruby
before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[provider] = valid_user
  visit "/users/auth/#{provider}"
  # Stubbing the api request, and setting the returned value as ex_response. 
  # ex_reponse is defined in the above block let(:ex_response) { blah balh blah }
  stub_request(:get, "#{ENV['DH_API_SITE']}/agents/#{valid_user.uid}/listings?auth_token=#{ENV['DH_API_KEY']}").to_return(body: ex_response)
end

it 'should return correct information from the api' do
  # ApiClient class sends the Net::HTTP request 
  client = ApiClient.new(valid_user.uid)
  # response returns the value from fetch_agent_listings
  # it returns the ex_response from the stubbed api call
  response = client.fetch_agent_listings
  expect(ex_response).to eq response
end
```

## Omniauth Integration test

Turn on the test_mode, create a mock_auth[provider] with fake user data. Stub_request by creating and reading the `fixtures/api_mock_user.json`. Have the `stub_request` return the `api_mock_user`. Create a new `ApiClient` class that contains api `fetch_some_api_data` method, which sends api requests. 
something like below.
In `fixtures` directory:
```ruby 
  # Stubbing api calls for testing
class ApiClient
  attr_reader :uid

  def initialize(uid=nil)
    @uid = uid
  end

  def fetch_agent_listings
    req = Net::HTTP.get(URI.parse("#{ENV['DH_API_SITE']}/agents/#{uid}/listings?auth_token=#{ENV['DH_API_KEY']}"))
  end

  def fetch_admin_listings
    req = Net::HTTP.get(URI.parse("#{ENV['DH_API_SITE']}/agents?auth_token=#{ENV['DH_API_KEY']}"))
  end

  def fetch_valid_user
    req = Net::HTTP.get(URI.parse("#{ENV['DH_API_SITE']}/agents/#{uid}?auth_token=#{ENV['DH_API_KEY']}"))
  end
end
```
In features/user_visits_listings_spec:
```ruby
require 'rails_helper'
require 'dotenv'
require 'fixtures/api_client'

RSpec.describe 'Listing Page Views', type: :feature do
  describe 'Visits /listings' do
    context 'when user is an agent' do
      let(:provider) { :doorkeeper }
      let(:valid_user) { FactoryGirl.create(:valid_user) }
      let(:api_response) { file_fixture('exclusive_listings_response.json').read }
      let(:api_valid_user) { file_fixture('valid_user_response.json').read }

      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[provider] = valid_user
        stub_request(:get, "#{ENV['DH_API_SITE']}/agents/#{valid_user.uid}/listings?auth_token=#{ENV['DH_API_KEY']}").to_return(body: api_response)
        stub_request(:get, "#{ENV['DH_API_SITE']}/agents/#{valid_user.uid}?auth_token=#{ENV['DH_API_KEY']}").to_return(body: api_valid_user)
        visit "/users/auth/#{provider}"
      end

      it 'should return correct information from the api' do
        client = ApiClient.new(valid_user.uid)
        response = client.fetch_agent_listings
        agent_response = client.fetch_valid_user

        expect(response).to eq api_response
        expect(agent_response).to eq api_valid_user
      end

      it 'should display the agent exclusive listings' do 
        visit '/listings'

        expect(page).to have_content('View My Listings')
        expect(page).to have_content('Colonnade East')
      end
    end

    context 'when user is an admin' do
      let(:provider) { :doorkeeper }
      let(:admin_user) { FactoryGirl.create(:admin_user) }
      let(:api_response) { file_fixture('all_exclusive_listings_response.json').read }
      let(:api_dmin_user) { file_fixture('valid_user_response.json').read }

      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[provider] = admin_user
        stub_request(:get, "#{ENV['DH_API_SITE']}/agents?auth_token=#{ENV['DH_API_KEY']}").to_return(body: api_response)
        visit "/users/auth/#{provider}"
      end

      it 'should return correct information from the api' do
        client = ApiClient.new
        response = client.fetch_admin_listings

        expect(response).to eq api_response
      end

      it 'should display all listings' do
        visit '/listings'

        expect(page).to have_content('View My Listings')
        expect(page).to have_content('Golf Country Club')
        expect(page).to have_content('apartment')
      end
    end
  end
end
```