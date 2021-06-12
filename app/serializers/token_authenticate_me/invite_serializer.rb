class TokenAuthenticateMe::InviteSerializer < ActiveModel::Serializer
  attributes :id, :email, :accepted, :meta, :creator, :created_at, :updated_at
end
