#!/bin/bash
if [ $1 ]; then
  PARAM=$1;
else
  PARAM=*;
fi

for FILE in grails-app/domain/avliscraftgrails/$PARAM.groovy; do
  FILE=avliscraftgrails.${FILE##*/};
  FILE=${FILE%.groovy};
  grails generate-all $FILE;
done
