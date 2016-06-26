require 'mechanize'

# get token from STDIN
print 'token: '
token = gets
url = "https://slack.com/api/users.list?token=#{token}"

# mechainze
agent = Mechanize.new

# get user list by HTTP request to slack
page = agent.get url

# parse
json = JSON.parse page.body
abort json['error'] unless json['ok']
members = json['members']

# output
puts members.map{|m|m['profile']['email']}.join("\n")
