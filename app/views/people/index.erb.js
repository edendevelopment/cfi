var people_data = <%= Person.all.to_json(:only => [:id, :name]) %>
