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

mvn archetype:generate -DgroupId=$groupId -DartifactId=$artifactId -Dname=$name -Dpackage=$package -DarchetypeGroupId=io.dropwizard.archetypes -DarchetypeArtifactId=java-simple -DinteractiveMode=false