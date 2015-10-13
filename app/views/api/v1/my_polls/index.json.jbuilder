json.partial! partial: "api/v1/resource", collection: @polls, as: :resource
"""
[{},{},{}] lo va guardando en al variable resoruve

json.array! @polls do |poll|
  #json.(poll,:id,:title,:description,:expires_at,:user_id)
  json.type poll.class.name.underscore.pluralize
  json.id poll.id
  json.attributes poll.attributes
end

"""