
## setup classpath
run:
`source variables.sh`

## Run it
check which version of scala is running:
`scala` 
it should print out the version you are using

use the correct versions for the libraries


from the root of the project run:
scala -classpath $SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s ExampleSpec