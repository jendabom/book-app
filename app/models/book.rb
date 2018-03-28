class Book < ApplicationRecord
  def as_json
    {
      title: title, 
      description: description, 
      pages: pages
    }
  end
end
