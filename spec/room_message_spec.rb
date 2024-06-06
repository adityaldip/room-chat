require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:room).inverse_of(:room_messages) }

  describe '#as_json' do
    let(:user) { User.create(username: "testuser", email: "user@example.com", password: "password", password_confirmation: "password") }
    let(:room) { Room.create(name: "Test Room") }
    let(:room_message) { RoomMessage.create(message: "Test message", user: user, room: room) }

    it 'returns the correct json representation' do
      expected_json = {
        "id" => room_message.id,
        "message" => "Test message",
        "room_id" => room.id,
        "user_id" => user.id,
        "created_at" => room_message.created_at.as_json,
        "updated_at" => room_message.updated_at.as_json,
        :user_avatar_url => user.gravatar_url
      }
      expect(room_message.as_json({})).to eq(expected_json)
    end
  end
end
