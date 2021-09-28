#!/bin/bash
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#         Birgitte Brydsö (bbrydsoe@cs.umu.se), 2020 
#

mkdir recipes
(
    cd recipes
    git init

    #
    # First commit
    #
    
    cat > cakerecipe.txt <<EOL
# Maraschino Devil's Food Cake
EOL
    git add cakerecipe.txt
    git commit -m "This is going to be a cake recipe"
    
    #
    # Second commit
    #
    
    cat > cakerecipe.txt <<EOL
# Maraschino Devil's Food Cake

## Ingredients

 - 2 cups sifted cake flour
 - 1 teaspoon soda
 - 2 eggs
 - 1 1/3 cup sugar
 - 1/2 cup snowdrift
 - 1/2 cup buttermilk
 - 1/4 cup Maraschino cherry juice
 - 1/2 cup chopped Marachino cherries
 - 2 squares unsweetened chocolate, melted and cooled

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
 8. Bake in two greased 9-inch layer pans lined with paper at 325f about 35
    minutes.
 9. Frost with fondant icing.
EOL
    git add cakerecipe.txt
    git commit -m "Add ingredients and directions"
    git branch metric
    git checkout metric
    cat > cakerecipe.txt <<EOL
# Maraschino Devil's Food Cake

## Ingredients

 - 250 g sifted cake flour
 - 1 teaspoon soda
 - 2 eggs
 - 275 g sugar
 - 125 g snowdrift or butter
 - 120 ml buttermilk
 - 60 ml Maraschino cherry juice
 - 1 dl chopped Marachino cherries
 - 2 squares unsweetened chocolate, melted and cooled

## Directions

 1. All ingredients mixed in same bowl.
 2. Mixing time three minutes.
 3. Sift together in large bowl flour, soda, and sugar.
 4. Add snowdrift, buttermilk and cherry juice.
 5. Mix enough to dampen flow; beat 2 minutes-if by hand, count beating time
    only; with electric mixer use low speed, beating 2 minutes.
 6. Add eggs and chocolate.
 7. Beat 1 minute for snowdrift, smooth batter, then fold in 1 dl chopped
    cherries dusted with flour.
 8. Bake in two greased 23cm layer pans lined with paper at 175C about 35
    minutes.
 9. Frost with fondant icing.
EOL
    git add cakerecipe.txt
    git commit -m "Change from imperial units to metric units."
    git checkout master
    cat > cakerecipe.txt <<EOL
# Maraschino Devil's Food Cake

## Ingredients

 - 2 cups sifted cake flour
 - 1 teaspoon soda
 - 2 eggs
 - 2 tsp instant coffee powder
 - 1 1/3 cup sugar
 - 1/2 cup snowdrift
 - 1/2 cup buttermilk
 - 1/4 cup Maraschino cherry juice
 - 1/2 cup chopped Marachino cherries
 - 2 squares unsweetened chocolate, melted and cooled

## Directions

 1. All ingredients mixed in same bowl.
 2. Mixing time three minutes.
 3. Sift together in large bowl flour, soda, and sugar.
 4. Add snowdrift, buttermilk and cherry juice.
 5. Mix enough to dampen flow; beat 2 minutes-if by hand, count beating time
    only; with electric mixer use low speed, beating 2 minutes.
 6. Add eggs and chocolate.
 7. Mix in the instant coffee powder. 
 8. Beat 1 minute for snowdrift, smooth batter, then fold in 1/2 cup chopped
    cherries dusted with flour.
 9. Bake in two greased 9-inch layer pans lined with paper at 325f about 35 minutes.
10. Frost with fondant icing.
EOL
    git add cakerecipe.txt
    git commit -m "Add 2 tsp of coffee powder."
    )
