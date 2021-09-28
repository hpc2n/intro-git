#!/bin/bash
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

mkdir repository
(
    cd repository
    git init
    set_user_info
    
    cat > recipe.txt <<EOL
# My fancy cake
EOL
    git add recipe.txt
    git commit -m "This is going to be a cake recipe"
    
    cat >> recipe.txt <<EOL
    
    cat > recipe.txt <<EOL
# Maraschino Devil's Food Cake
EOL
    git add recipe.txt
    git commit -m "Better name for the cake"
    
    cat >> recipe.txt <<EOL

## Ingredients

 - 2 cup sifted cake flour
 - 1 teaspoon soda
 - 1 1/3 cup sugar
 - 1/2 cup snowdrift
 - 1/2 cup buttermilk
 - 1/4 cup Maraschino cherry juice
 - 2 eggs
 - 2 squares unsweetened chocolate, melted and cooled
EOL
    git add recipe.txt
    git commit -m "Add ingredients"
    
    cat >> recipe.txt <<EOL

## Directions

 1. All ingredients mixed in same bowl.
 2. Mixing time three minutes.
 3. Sift together in large bowl flour, soda, and sugar.
 4. Add snowdrift, buttermilk and cherry juice.
 5. Mix enough to dampen flow; beat 2 minutes-if by hand, count beating time
    only; with electric mixer use low speed, beating 2 minutes.
 6. Add eggs and chocolate.
 7. Beat 1 minute for snowdrift, smooth batter, then fold in 1/2 cup chopped
    cherries dusted with flour.
 8. Bake in two greased a-inch layer pans lined with paper at 325f about 35
    minutes.
 9. Frost with fondant icing.
EOL
    git add recipe.txt
    git commit -m "Add directions"

    cat >> recipe.txt <<EOL

## Other ideas and hints

 - Adding some instant coffee might give the case some extra kick.
EOL
    git add recipe.txt
    git commit -m "Add other ideas and hints"
)
