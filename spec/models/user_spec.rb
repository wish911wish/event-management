require 'rails_helper'
describe User do
  describe '#create' do
    context 'can save' do
      it "is valid" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name][0]).to include("入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email][0]).to include("入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password][0]).to include("入力してください")
      end

      it "is invalid because password_confirmation are different" do
        user = build(:user, password: "123456", password_confirmation: "654321")
        user.valid?
        expect(user.errors[:password_confirmation][0]).to include("入力が一致しません")
      end

      it "is invalid with password 5 letters or less" do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password][0]).to include("6文字以上で入力してください")
      end
    end
  end
end
