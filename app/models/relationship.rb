class Relationship < ActiveRecord::Base
belongs_to :challenger, class_name: "User"
belongs_to :challenged, class_name: "User"

end
