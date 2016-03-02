#!/bin/bash

groupId="$1"
artifactId="$2"
name="$3"
package="$4"

if [ -z "$groupId" ]
	then
		echo -n "Enter groupId: "
		read groupId
fi
if [ -z "$artifactId" ]
	then
		echo -n "Enter artifactId: "
		read artifactId
fi
if [ -z "$name" ]
	then
		echo -n "Enter project name: "
		read name
fi
if [ -z "$package" ]
	then
		echo -n "Enter package identifier: "
		read package
fi

# Create the maven project
mvn archetype:generate -DgroupId=$groupId -DartifactId=$artifactId -Dname=$name -Dpackage=$package -DarchetypeGroupId=io.dropwizard.archetypes -DarchetypeArtifactId=java-simple -DinteractiveMode=false

# Add some dependencies to the pom
sed -i '' '42r dependencies.xml' "$artifactId"/pom.xml
sed -i '' 's/<source>1.7<\/source>/<source>1.8<\/source>/' "$artifactId"/pom.xml
sed -i '' 's/<target>1.7<\/target>/<target>1.8<\/target>/' "$artifactId"/pom.xml