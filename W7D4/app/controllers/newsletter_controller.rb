class NewsletterController < ApplicationController
  def new
    @users = User.all
  end

  def send
    puts '--------2------'
    @user = User.new(params[:user])
    puts "New User"
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        puts "Mail envoyé"
        format.html{ redirect_to(@user, notice: 'User was successfully created.') }
        format.json{ render json: @user, status: :created, location: @user }
        puts "sauvegarde de user"
        UserMailer.with(user: @user).welcome_email.deliver_now
      else
        format.html{ render action: 'new' }
        format.json{ render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
