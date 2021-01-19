class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    existing_user = User.find_by(email: email)
    if !existing_user
      new_user = User.create(
        name: name,
        email: email,
        password: password,
      )
      response_text = "Created new User : #{name} with Email : #{email}"
      render plain: response_text
    else
      render plain: "User with Email : #{email} already exists"
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user && user.password == password
      render plain: true
    else
      render plain: false
    end
  end
end
