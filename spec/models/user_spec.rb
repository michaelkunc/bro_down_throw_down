require 'rails_helper'

describe User do
  describe "validations" do


    before (:each) do
      @user = User.new({username: "direstraits",
                        email: "money@fornothing.com",
                        image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Markknopfler20061.jpg/440px-Markknopfler20061.jpg",
                        bio: "I play the git-tar on the mtv",
                        password: "password"})
      @user2 = User.new({username: "direstraits",
                        email: "money@fornothing.com",
                        image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Markknopfler20061.jpg/440px-Markknopfler20061.jpg",
                        bio: "I play the git-tar on the mtv",
                        password: "password"})


    end

    it 'is valid with a unique username and unique email ' do
      expect(@user.save).to eq(true)
    end

    it 'is not valid without a username' do
      @user.username = ''
      expect(@user.save).to eq(false)
    end

    it 'is not valid without an email' do
      @user.email = ''
      expect(@user.save).to eq(false)
    end

    it 'is not valid without a password less than 6 characters' do
      @user.password = 'sssss'
      expect(@user.save).to eq(false)
    end

    it 'is not valid with a bio longer than 1000 characters' do
      @user.bio = "w" * 1001
      expect(@user.save).to eq(false)
    end

    it 'should not allow duplicate usernames' do
      @user.save
      expect(@user2.save).to eq(false)
    end

    it 'should not allow duplicate emails' do
      @user.save
      expect(@user2.save).to eq(false)
    end


  end


end