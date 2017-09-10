require 'json'
recipes = Dir.entries('.')
#recipes.each do |r|
      c = 0
  rec = File.read('cool.json')
   reci = JSON.parse(rec)
      reci.each do |r|
        
           if r["name"] == ""
            r.delete(r)
        end
        @item = Item.new(name: r["name"], cuisine: r["cuisine"])
        if @item.save
            @recipe = Recipe.new(name: r["name"], cook_time: r["cook_time"], item_id: @item.id, chef_id: 1)
            if @recipe.save
                @item.recipe_id = @recipe.id 
                r["ingredients"].each do |i|
                    @ing = Ingredient.new(content: i, recipe_id: @recipe.id)
                    @ing.save
                    
                end
                r["instructions"].each do |i|
                    @ins = Instruction.new(content: i, recipe_id: @recipe.id)
                    @ins.save
                    
                end
                
                p @item 
            end
        end
    end


    #end