require 'json'
recipes = Dir.entries('db/re')
recipes.each do |r|
   if r.split(".")[1] == "json" 
        rec = File.read('db/re/' + r) 
        reci = JSON.parse(rec)
        reci.each do |r|
             if r["name"] == ""
                r.delete(r)
             else
                @item = Item.create(name: r["name"], cuisine: r["cuisine"])
                    @recipe = Recipe.create(name: r["name"], cook_time: r["cook_time"], item_id: @item.id, chef_id: 1)
                    @item.recipe_id = @recipe.id
                    @item.save
                    if @recipe.save
                     r["ingredients"].each do |i|
                              i = i.split(" ")
                              if i[0].to_f != 0
                                  if (i[1].downcase == "gm" || i[1].downcase == "cup" || i[1].downcase == "ml" || i[1].downcase == "tbsp" || i[1].downcase == "tsp" || i[1].downcase == "kg" || i[1].downcase == "tbsp," || i[1].downcase == "tbs" || i[1].downcase == "ltr" || i[1].downcase == "scoops" || i[1].downcase == "tbsp." || i[1].downcase == "tbsp "|| i[1].downcase == "cups" || i[1].downcase == "teaspoon" || i[1].downcase == "tablespoons" || i[1].downcase == "tablespoon" || i[1].downcase == "teaspoons" || i[1].downcase == "gms" || i[1].downcase == "grams" || i[1].downcase == "bowl"  || i[1].downcase == "tsp." || i[1].downcase == "gram" || i[1].downcase == "pieces" || i[1].downcase == "g"  || i[1].downcase == "litre"   )
                                    quantity = i[0].to_f
                                    quantity_type = i[1].strip.chomp.split(",")[0]
                                    i.shift
                                   end
                                   i.shift
                               end
                                i = i.join(" ")
                                @ing = Ingredient.create(content: i.capitalize, recipe_id: @recipe.id, quantity: quantity, quantity_type: quantity_type)

                        end
                        r["instructions"].each do |i|
                               @ins = Instruction.create(content: i, recipe_id: @recipe.id)
                        end
                    end
                
            end
        end

    end
end
