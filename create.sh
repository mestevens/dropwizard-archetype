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

# Set-up the config
path=`echo "$package" | tr . /`
touch "$artifactId"/src/main/resources/application.conf
rm -f "$artifactId"/config.yml
sed -i '' 's/'"$name"'Configuration/TypesafeConfiguration/g' "$artifactId"/src/main/java/"$path"/"$name"Application.java
sed -i '' '6i\
import ca.mestevens.java.configuration.TypesafeConfiguration;\
import ca.mestevens.java.configuration.bundle.TypesafeConfigurationBundle;
' "$artifactId"/src/main/java/"$path"/"$name"Application.java
sed -i '' '23i\
bootstrap.addBundle(new TypesafeConfigurationBundle());
' "$artifactId"/src/main/java/"$path"/"$name"Application.java
sed -i '' '23s/^/       /' "$artifactId"/src/main/java/"$path"/"$name"Application.java
rm -f "$artifactId"/src/main/java/"$path"/"$name"Configuration.java