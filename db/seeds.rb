require 'json'
recipes = Dir.entries('db/recipes')
recipes.each do |re|
    if re.include?('recipes-')
        rec = File.read('db/recipes/' + re) 
        reci = JSON.parse(rec)
        reci.each do |r|
            if r["category"] == nil
                category = 'uncategorised'
            else 
                category = r['category']
            end
            @item = Item.create(name: r["name"], cuisine: category)
            if @item.save
                p "Item succefully created #{@item.id} from #{re}"
                @recipe = Recipe.create(name: r["name"], cook_time: r["cook_time"], item_id: @item.id, chef_id: 1, chef_name: 'Erwin Track')
                if @recipe.save
                    p "Recipe Successfully created #{@recipe.id}"
                    @item.recipe_id = @recipe.id 
                    @item.save
                    r["ingredients"].each do |i|
                        if i["quantity_type"] == nil and i["quantity"] != nil
                            qt = 'nos.'
                            @ing = Ingredient.create(content: i["content"].capitalize, recipe_id: @recipe.id, quantity: i['quantity'], quantity_type: qt)
                        else
                            @ing = Ingredient.create(content: i["content"].capitalize, recipe_id: @recipe.id, quantity: i['quantity'], quantity_type: i['quantity_type'])
                        end
        
                    end
                    r["instructions"].each do |i|
                            @ins = Instruction.create(content: i, recipe_id: @recipe.id)
                    end
                else 
                    p @recipe.errors.messages
                end
            else
                p @item.errors.messages    
            end
        end
    end
end