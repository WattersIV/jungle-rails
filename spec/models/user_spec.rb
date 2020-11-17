require 'user.rb'
require 'rails_helper'

RSpec.describe User, type: :model do
  name = 'Bill'
  password= 'apples' 
  email = 'testy@test.com'
  describe 'Validations' do
    it 'should require a password' do 
      @user = User.new 
      @user.save 
      expect(@user.errors.messages[:password]).to eq ["can't be blank", "is too short (minimum is 5 characters)"]
    end

    it 'should reject when passwords dont match' do 
      @user = User.new 
      @user.name = name 
      @user.password = password 
      @user.password_confirmation = 'apple' 
      @user.email = email

      @user.save 
      expect(@user).not_to be_valid
    end 
    
    it 'should work with all fields filled' do 
      @user = User.new 
      @user.name = name 
      @user.password = password 
      @user.password_confirmation = password 
      @user.email = email

      @user.save 
      expect(@user).to be_valid
    end 

    it 'should fail with missing confirm pass' do 
      @user = User.new 
      @user.name = name 
      @user.password_confirmation = password 
      @user.email = email

      @user.save 
      expect(@user).not_to be_valid
    end 

    it 'should require 5 char password' do 
      @user = User.new 
      @user.name = name 
      @user.password = 'not'       
      @user.password_confirmation = 'not' 
      @user.email = email

      @user.save 
      expect(@user).not_to be_valid
    end 

    it 'shouldnt work with uppercase copy' do 
      @user = User.new 
      @user.name = name 
      @user.password = password       
      @user.password_confirmation = password 
      @user.email = email 

      @user.save

      @user1 = User.new 
      @user1.name = name 
      @user1.password = password       
      @user1.password_confirmation = password 
      @user1.email =  'TESTY@test.com'


      @user1.save 
      expect(@user1).not_to be_valid
    end  


  end
end