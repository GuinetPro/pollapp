#json.array! @questions do |question|
# json.(question,:id,:description)
# end
json.partial! partial: "api/v1/resource", collection: @questions, as: :resource