class SignupController < ApplicationController
  require 'payjp' #payjpの読み込み

  def create
    @user = User.new


    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
   
    else
      render '/signup/step1'
    end
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] 
    
      customer = Payjp::Customer.create(        
        description: 'test',                    
        email: current_user.email,             
        card: params['payjp_token'],            
        metadata: {user_id: current_user.id}    
      )
      @card = Card.new(                 
        user_id: current_user.id,        
        customer_id: customer.id,        
        card_id: customer.default_card   
      )

      if @card.save
        redirect_to done_signup_index_path
      else
        redirect_to action: "create"
      end
    end
end
