#################
    #REQUIRES
#################


require 'pg'
require 'sinatra'
require 'pry'



#################
    #METHODS
#################


def db_connection
  begin
    connection = PG.connect(dbname: 'recipes')

    yield(connection)

  ensure
    connection.close
  end
end

def get_recipe_list(query)
  db_connection do |conn|
    conn.exec(query)
  end
end

def get_details(query, selected)
  db_connection do |conn|
    conn.exec_params(query, selected)
  end
end

# def get_ingredients(query, selected)
#   db_connection do |conn|
#     conn.exec_params(query, selected)
#   end
# end



#################
    #ROUTES
#################

get '/' do
  redirect '/recipes'
end

# As a chef
# I want to view a list of recipes
# So that I may choose one that seems appetizing

get '/recipes' do
  query = '
    SELECT recipes.id AS id, recipes.name AS name FROM recipes
    ORDER BY name'

  @recipe_list = get_recipe_list(query)
  erb :recipe_list
end


# As a chef
# I want to view the details for a single recipe
# So that I can learn how to prepare it


get '/recipes/:id' do
  selected = params[:id]

  query = 'SELECT recipes.name AS name, recipes.description AS description, recipes.instructions AS instructions, ingredients.name AS ingredients FROM recipes
  LEFT OUTER JOIN ingredients ON ingredients.recipe_id = recipes.id
  WHERE recipes.id = $1;'

  ingredients_query = 'SELECT ingredients.name FROM ingredients
    JOIN recipes ON recipes.id = ingredients.recipe_id
    WHERE recipes.id = $1'

  @current = get_details(query, [selected])
  @ingredients = get_details(ingredients_query, [selected])

  erb :details

end













