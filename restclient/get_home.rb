site = "http://0.0.0.0:3000"

resp = RestClient.get site, :accept => 'application/json'

puts "response was nil" if resp == nil
resp.code unless resp == nil
resp.cookies unless resp == nil


#resp = RestClient.post site + '/account.json', :user => {:name => 'someone or other', :email => Time.now.min.to_s+Time.now.sec.to_s+'aaa1221a@bbcbcc.com',:login => Time.now.min.to_s+Time.now.sec.to_s+'-login', :password =>'1234', :password_confirmation => '1234'}
#resp = RestClient.post site + '/account.json', :user => {:name => 'someone or other', :email => Time.now.min.to_s+Time.now.sec.to_s+'aaa1221a@bbcbcc.com',:login => Time.now.min.to_s+Time.now.sec.to_s+'-login', :password =>'1234'}
#puts "response was nil" if resp == nil
#resp.code unless resp == nil
#resp.cookies unless resp == nil
