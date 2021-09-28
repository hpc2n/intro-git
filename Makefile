#
# Author: Mirko Myllykoski (mirkom@cs.umu.se), 2020
#

all: git_materials git_materials.zip

git_materials: generate.sh $(shell find scripts/ include/ -type f)
	./generate.sh scripts/ git_materials/
	touch git_materials

git_materials.zip: git_materials
	zip -r git_materials.zip git_materials

clean:
	rm -rf git_materials git_materials.zip
