#!/bin/bash
# https://stackoverflow.com/questions/22075534/how-do-i-set-the-classpath-when-using-the-scalatest-runner
# http://www.scalatest.org/user_guide/using_the_runner

export IVY2=/Users/odendm/.ivy2/cache
export SCALATEST=$IVY2/org.scalatest/scalatest_2.12/bundles/scalatest_2.12-3.0.5.jar
export SCALACTIC=$IVY2/org.scalactic/scalactic_2.12/bundles/scalactic_2.12-3.0.5.jar

export PACKAGE_JAR=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT.jar
export PACKAGE_TEST_JAR=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT-tests.jar

export DEPS=$(sbt --error "export compile:dependencyClasspath")
echo $DEPS
export DEPSTEST=$(sbt --error "export test:fullClasspath")
echo $DEPSTEST

function buildScala {
    echo building project
    sbt "compile;test:compile;package;test:package"
}

buildScala

# And then run tests:
TARGETDIR=./target/scala-2.12
TARGETPATH=$TARGETDIR/test-classes

# PROJECTCLASSES=$PACKAGE_JAR:$PACKAGE_TEST_JAR
PROJECTCLASSES=$PACKAGE_JAR

# DEPENDANCIES=$SCALATEST:$SCALACTIC:$PROJECTCLASSES
DEPENDANCIES=$DEPSTEST:$PROJECTCLASSES
# DEPENDANCIES=$SCALATEST:$SCALACTIC

# scala -classpath $DEPSTEST:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
# scala -classpath $DEPSTEST:$PACKAGE:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE_JAR:$PACKAGE_TEST_JAR org.scalatest.tools.Runner -R -o -s CubeCalculatorTest
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE_TEST_JAR:$PACKAGE_JAR org.scalatest.tools.Runner -R $PACKAGE_TEST_JAR -o -s CubeCalculatorTest
# scala -cp $SCALATEST:$SCALACTIC:$PACKAGE_JAR:$PACKAGE_TEST_JAR org.scalatest.tools.Runner -R $PACKAGE_TEST_JAR -o -s CubeCalculatorTest
echo running the tests one-by-one
echo running CubeCalculatorTest
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -o -s CubeCalculatorTest;
echo running ExampleSpec
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -o -s ExampleSpec;
echo running all in path
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -oWD;

# $SCALATEST:$SCALACTIC:$PACKAGE_JAR:$PACKAGE_TEST_JAR
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE_JAR:$PACKAGE_TEST_JAR org.scalatest.tools.Runner -R $PACKAGE_TEST_JAR -o -s CubeCalculatorTest
# `scala -J-Xmx4G -J-Xms4G -cp “/home/neil/.ivy2/cache/org.scalatest/scalatest_2.11/bundles/scalatest_2.11-2.2.6.jar:./target/scala-2.11/neatapp-assembly-0.1-SNAPSHOT_shrunk.jar:./target/scala-2.11/neatapp_2.11-0.1-SNAPSHOT-tests.jar” org.scalatest.run org.activeintel.MySpec`