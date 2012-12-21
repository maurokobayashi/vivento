namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
        User.create!(email: "mauro.kobayashi@gmail.com",
            password: "rtg32oue",
            password_confirmation: "rtg32oue")
        99.times do |n|
            email = "jose#{n+1}@gmail.com"
            password  = "rtg32oue"
            User.create!(email: email,
                password: password,
                password_confirmation: password)
        end
    end
end