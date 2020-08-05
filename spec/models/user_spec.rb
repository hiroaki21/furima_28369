require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが一意でないと登録できないこと" do
      @user.save
      another_user=FactoryBot.build(:user,email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      
    end

    it "emailに@を含むと登録できる" do
      @user.email="am@.com"
      expect(@user).to be_valid
    end

    it "passwordが空では登録できないこと" do
      @user.password=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "passwordは6文字以上でないと登録できないこと" do
      @user.password="12345"
      @user.password_confirmation="12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      
    end

    it "passwordが半角英数字混合以外だと登録できないこと" do
      @user.password="122223"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "本名の名字が空だと登録できないこと" do
      @user.last_name=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "本名の名前が空だと登録できないこと" do
      @user.first_name=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名字は全角（漢字、ひらがな、カタカナ）以外だと登録できないこと" do
      @user.last_name="aaaa1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "名前は全角（漢字、ひらがな、カタカナ）以外だと登録できないこと" do
      @user.first_name="zzzzz9"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "本名フリガナは名字が空だと登録できないこと" do
      @user.last_name_kana=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "本名フリガナは名前が空だと登録できないこと" do
      @user.first_name_kana=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "名字フリガナは全角（カタカナ）以外だと登録できないこと" do
      @user.last_name_kana="あああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end

    it "名前フリガナは全角（カタカナ）以外だと登録できないこと" do
      @user.first_name_kana="漢字"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "誕生日が空だと登録できないこと" do
      @user.birth_date=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    
  end
end