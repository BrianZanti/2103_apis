require 'rails_helper'

RSpec.describe GithubService do
  it 'returns the users data' do
    mock_response = '{
      login: "BrianZanti",
      id: 8962411,
      node_id: "MDQ6VXNlcjg5NjI0MTE=",
      avatar_url: "https://avatars.githubusercontent.com/u/8962411?v=4",
      gravatar_id: "",
      url: "https://api.github.com/users/BrianZanti",
      html_url: "https://github.com/BrianZanti",
      followers_url: "https://api.github.com/users/BrianZanti/followers",
      following_url: "https://api.github.com/users/BrianZanti/following{/other_user}",
      gists_url: "https://api.github.com/users/BrianZanti/gists{/gist_id}",
      starred_url: "https://api.github.com/users/BrianZanti/starred{/owner}{/repo}",
      subscriptions_url: "https://api.github.com/users/BrianZanti/subscriptions",
      organizations_url: "https://api.github.com/users/BrianZanti/orgs",
      repos_url: "https://api.github.com/users/BrianZanti/repos",
      events_url: "https://api.github.com/users/BrianZanti/events{/privacy}",
      received_events_url: "https://api.github.com/users/BrianZanti/received_events",
      type: "User",
      site_admin: false,
      name: "Brian Zanti",
      company: nil,
      blog: "",
      location: nil,
      email: nil,
      hireable: nil,
      bio: nil,
      twitter_username: nil,
      public_repos: 70,
      public_gists: 31,
      followers: 31,
      following: 30,
      created_at: "2014-09-29T18:05:53Z",
      updated_at: "2021-06-01T15:07:20Z"
    }'
    # allow(GithubService).to receive(:user_info).and_return(mock_response)
    allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)
    json = GithubService.user_info('brianzanti')


    expect(json).to be_a(Hash)
    expect(json).to have_key(:followers)
    expect(json).to have_key(:following)
    expect(json).to have_key(:name)
    expect(json).to have_key(:login)
    expect(json).to have_key(:created_at)
  end
end
