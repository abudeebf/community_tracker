namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example User",
    	         last_name:'dkjdf',
                 email: "example@35gfrailstutorial.org",
                 password: "Zorolove5@",
                 gender:"Female",
                 password_confirmation: "Zorolove5@")
    99.times do |n|
     first_name  = "x #{n+1}"
     last_name="y #{n+1}"
      email = "example-#{n+5}@railstutorial.org"
      password  = "Password@1"
      User.create!(first_name: first_name,
      	           last_name:last_name,
                   email: email,
                   password: password,
                   gender:"Female",
                   password_confirmation: password)
    end
  end
end
