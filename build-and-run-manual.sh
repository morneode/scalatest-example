#!/bin/bash

# ACCEPTANCE=/opt/jemstep/code/stormsend/stormsend-acceptance/target/scala-2.11/stormsend-acceptance_2.11-1.0.jar

#scala -classpath $ACCEPTANCE  -classpath $SCALATEST org.scalatest.tools.Runner -p compiled_tests
# scala -classpath $SCALATEST  org.scalatest.tools.Runner -p compiled_tests

source variables.sh

OUT=out
mkdir $OUT

# And then run tests:

# java -cp "<path to scalatest.jar>":$DEPS org.scalatest.tools.Runner -R target
# scala $CLASSPATH org.scalatest.run ExampleSpec


# echo running jar
# scala -classpath target/scala-2.12/classes:target/scala-2.12/test-classes:$SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest
# java -jar $SCALATEST -R $PACKAGETEST -g -s CubeCalculatorTest
# java -jar $SCALATEST -R mydir -g -f test.out -s MySuite

# echo running
# scala -classpath target/scala-2.12/classes:target/scala-2.12/test-classes:$SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest

##########################################
echo compiling main
scalac src/main/scala/CubeCalculator.scala -d $OUT
echo compiling main jar
scalac src/main/scala/CubeCalculator.scala -d $OUT/CubeCalculator.jar

echo running main
scala -classpath out/ CubeCalculator
echo running main jar
scala -classpath out/CubeCalculator.jar CubeCalculator

echo compiling test
scalac -classpath out:$SCALATEST:$SCALACTIC src/test/scala/CubeCalculatorTest.scala -d $OUT
echo compiling test jar
scalac -classpath out:$SCALATEST:$SCALACTIC src/test/scala/CubeCalculatorTest.scala -d $OUT/CubeCalculatorTest.jar

echo running test
scala -classpath out:$SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest
scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST org.scalatest.tools.Runner -R . -o -s CubeCalculatorTest
echo running test jar
scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE:out/CubeCalculatorTest.jar org.scalatest.tools.Runner -R CubeCalculatorTest.jar -o -s CubeCalculatorTest
scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST org.scalatest.tools.Runner -R $PACKAGETEST -o -s CubeCalculatorTest


# scalac -classpath $SCALATEST:$SCALACTIC src/test/scala/ExampleSpec.scala
# scala -classpath $SCALATEST:$SCALACTIC org.scalatest.tools.Runner -R . -o -s ExampleSpec


# Get classpath of all dependencies with:

# DEPS=$(sbt --error "export compile:dependencyClasspath")
# DEPSTEST=$(sbt --error "export test:dependencyClasspath")

# And then run tests:

# java -cp "<path to scalatest.jar>":$DEPS org.scalatest.tools.Runner -R target