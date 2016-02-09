#!/bin/bash

mvn archetype:generate -DgroupId=$1 -DartifactId=$2 -Dname=$3 -Dpackage=$4 -DarchetypeGroupId=io.dropwizard.archetypes -DarchetypeArtifactId=java-simple -DinteractiveMode=false