
class StaticPagesController < ApplicationController
  def home
    
    @russell = {name: "russell", ocupation: "developer"}
  end

  def help

  end

  def about
  end
  
  def tinder

    id = '6415539'
    token = 'CAAGm0PX4ZCpsBAPoorQHbOtAkEjFP4DHC8cPZAZCWe48Pn2cKxlk8pylwTZAar7a1rYtjLLPpO0TG3YF28hhxn2s1eoDvgpr3Inc4CspZA6yAoG943wy9xXYxXFD0JjJfti5rCFAMCGitdOO0FYMBRE6cynneu1chuuOEdJKozxsq5UvbMOUdXfHS5jYn8253OqPf36ZBESZBQdGO6mDWJ18DXRUGyXrVwZD'


    pyro = TinderPyro::Client.new
    pyro.sign_in(id, token)
    
    @nearby = pyro.get_nearby_users;
    @results = pyro.fetch_updates
    
    @users = Array.new
    @nearby['results'].each do |user|
      @user1 = pyro.info_for_user(user['_id'])
    end
    
    
        

    
  end


  def lob
    
    @lob = Lob.load(api_key: "test_a608607135d2ade5e64417316ea2d84c511")  

    @currentAddresses = @lob.addresses.list(count: 100, offset: 0)

    if params[:submitted]
          
      @results = @lob.addresses.create(
        name: params[:name],
        address_line1: params[:address_line1],
        address_line2: params[:address_line2],
        city: params[:city],
        state: params[:state],
        country: params[:country],
        zip: params[:zip]
      )
      
    end

  end
  
  
  def lob_send
    
    @lob = Lob.load(api_key: "test_a608607135d2ade5e64417316ea2d84c511")  
    @selectAddr = []
    
    currentAddresses = @lob.addresses.list(count: 100, offset: 0)    
    currentAddresses.each do |addr|
      @selectAddr.push([addr['address_line1'], addr['id']])
    end

    if params[:submitted]
          
      @results = @lob.postcards.create(
        name: params[:name],
        to: params[:to],
        from: params[:from],
        front: params[:front],
        message: params[:message],
        # back: params[:back],
      )
      
    end

  end  

  def contact
  end

end
