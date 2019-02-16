require 'rails_helper'
describe Event do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  describe '#create' do
    context 'can seve' do
      it "is valid" do
        event = build(:event, user_id: user.id, group_id: group.id)
        event.valid?
        expect(event).to be_valid
      end

      it "is valid without comment" do
        event = build(:event, user_id: user.id, group_id: group.id, comment: "")
        event.valid?
        expect(event).to be_valid
      end

    end

    context 'can not seve' do

      it "is invalid without name" do
        event = build(:event, user_id: user.id, group_id: group.id, name: "")
        event.valid?
        expect(event.errors[:name][0]).to include("入力してください")
      end

      it "is invalid without user_id" do
        event = build(:event, user_id: "", group_id: group.id)
        event.valid?
        expect(event.errors[:user_id][0]).to include("入力してください")
      end
    end
  end
end
