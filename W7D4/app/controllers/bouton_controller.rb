class BoutonController < ApplicationController
  def subscribe
  end

  def subs
    if current_user.subscribe != true
      current_user.subscribe = true
      current_user.save
    else
      puts "coucou"
      current_user.subscribe = false
      current_user.save
    end
    redirect_to root_path
  end
end
