task :do_add_user => :environment do

site = "http://0.0.0.0:3000"

ddd = User.where(:login => 'ddd').first
ddd.destroy unless ddd.nil?

resp = RestClient.post site + '/account' , {:user => {:login => 'ddd', :password => '123456', :password_confirmation => '123456'}}, :accept => 'application/json'

puts "response was nil" if resp == nil
resp.code unless resp == nil
#resp.cookies unless resp == nil

end