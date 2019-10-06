#!/bin/bash
# https://stackoverflow.com/questions/22075534/how-do-i-set-the-classpath-when-using-the-scalatest-runner

# source variables.sh

# ACCEPTANCE=/opt/jemstep/code/stormsend/stormsend-acceptance/target/scala-2.11/stormsend-acceptance_2.11-1.0.jar

#scala -classpath $ACCEPTANCE  -classpath $SCALATEST org.scalatest.tools.Runner -p compiled_tests
# scala -classpath $SCALATEST  org.scalatest.tools.Runner -p compiled_tests

# And then run tests:
JARFILE=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT-tests.jar
# java -cp "<path to scalatest.jar>":$DEPS org.scalatest.tools.Runner -R target
# java -cp $DEPSTEST org.scalatest.tools.Runner -p ExampleSpec
# java -jar $SCALATEST -classpath $DEPSTEST org.scalatest.tools.Runner -R ExampleSpec
java -cp $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST -jar $SCALATEST -s CubeCalculatorTest
# scala $CLASSPATH org.scalatest.run ExampleSpec