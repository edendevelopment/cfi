var people_data = <%= Person.all.to_json(:only => [:id], :methods => [:name_and_village]) %>
