#!/bin/bash
#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

mkdir repository
(
    cd repository
    git init
    set_user_info

    touch file.txt
    git add file.txt
    
    cat > file.txt <<EOL
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sollicitudin tellus eu aliquam lobortis. Aenean laoreet consectetur augue non cursus. In vel efficitur lectus.
EOL
    git commit -a -m "The first words of my great thesis"
    
    cat >> file.txt <<EOL
Suspendisse potenti. Cras non placerat sapien, eu sollicitudin ex.
EOL
    git commit -a -m "I am very proud what I have done here"

    git checkout -b new_direction
    
    cat >> file.txt <<EOL
Fusce aliquam dapibus ligula, congue accumsan odio sollicitudin sed.
EOL
    git commit -a -m "Time to try something new"
    
    cat >> file.txt <<EOL
Quisque auctor elit eu lacinia dictum.
EOL
    git commit -a -m "This might be the right way to go"

    git checkout master

    cat >> file.txt <<EOL
Mauris iaculis arcu vitae sapien volutpat, id tempor sapien ullamcorper.
EOL
    git commit -a -m "I am not going to abandon this path yet"
    
    cat >> file.txt <<EOL
Duis et rhoncus arcu. Maecenas in elit imperdiet, consectetur velit id, interdum nisi.
EOL
    git commit -a -m "Being so productive"
    
    git checkout -b experiment
    
    cat >> file.txt <<EOL
Curabitur nec eleifend turpis.
EOL
    git commit -a -m "I love experiment work"
    
    git checkout master
    
    cat >> file.txt <<EOL
Curabitur ex enim, rutrum et posuere eget, aliquam vel diam.
EOL
    git commit -a -m "Still not sure about what I should do"
)
