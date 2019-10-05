#!/bin/bash

# ACCEPTANCE=/opt/jemstep/code/stormsend/stormsend-acceptance/target/scala-2.11/stormsend-acceptance_2.11-1.0.jar

#scala -classpath $ACCEPTANCE  -classpath $SCALATEST org.scalatest.tools.Runner -p compiled_tests
# scala -classpath $SCALATEST  org.scalatest.tools.Runner -p compiled_tests

# scala $CLASSPATH org.scalatest.run ExampleSpec
source variables.sh

echo running
scala -classpath target/scala-2.12/classes:target/scala-2.12/test-classes:$SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest


# echo compiling main
# scalac src/main/scala/CubeCalculator.scala
# echo compiling test
# scalac -classpath .:$SCALATEST:$SCALACTIC:$PACKAGE src/test/scala/CubeCalculatorTest.scala
# echo running
# scala -classpath .:$SCALATEST:$SCALACTIC:$PACKAGE org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest

# scalac -classpath $SCALATEST:$SCALACTIC src/test/scala/ExampleSpec.scala
# scala -classpath $SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s ExampleSpec
