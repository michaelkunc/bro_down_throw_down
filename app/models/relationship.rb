class Relationship < ActiveRecord::Base
belongs_to :challenger, class_name: "User"
belongs_to :challenged, class_name: "User"

validates :challenger_id, presence: true
validates :challenged_id, presence: true

end
