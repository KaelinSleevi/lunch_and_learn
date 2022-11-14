class PlaceSerializer
  include JSONAPI::Serializer
  set_id {nil}
  attributes :type, :name, :address, :place_id
end