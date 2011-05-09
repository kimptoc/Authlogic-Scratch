task :do_update => :environment do

site = "http://0.0.0.0:3000"

resp = RestClient.post site + '/user_session' , {:user_session => {:login => 'ccc', :password => '123456'}}, :accept => 'application/json'

puts "response was nil" if resp == nil
puts resp.code unless resp == nil
#resp.cookies unless resp == nil

#puts "SAT=" + JSON.parse(resp.body)["user"]["user"].to_s unless resp == nil
SAT = JSON.parse(resp.body)["user"]["user"]["single_access_token"] unless resp == nil

#SAT - single access token - can use this to do further requests without passing login/password

# get user details to prove this

resp = RestClient.get site + "/account?user_credentials=#{SAT}", :accept => 'application/json'

puts "response was nil" if resp == nil
puts resp.code unless resp == nil
#resp.cookies unless resp == nil


resp = RestClient.put site + "/account?user_credentials=#{SAT}", {:user => {:email => 'qwerty-' + rand().to_s }}, :accept => 'application/json'

puts "response was nil" if resp == nil
puts resp.code unless resp == nil
#resp.cookies unless resp == nil




resp = RestClient.get site + "/account?user_credentials=#{SAT}", :accept => 'application/json'

puts "response was nil" if resp == nil
puts resp.code unless resp == nil
#resp.cookies unless resp == nil

end