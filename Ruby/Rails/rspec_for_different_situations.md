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