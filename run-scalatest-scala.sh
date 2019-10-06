#!/bin/bash

# https://stackoverflow.com/questions/22075534/how-do-i-set-the-classpath-when-using-the-scalatest-runner
# http://www.scalatest.org/user_guide/using_the_runner

export IVY2=/Users/odendm/.ivy2/cache
export SCALATEST=$IVY2/org.scalatest/scalatest_2.12/bundles/scalatest_2.12-3.0.5.jar
export SCALACTIC=$IVY2/org.scalactic/scalactic_2.12/bundles/scalactic_2.12-3.0.5.jar

export PACKAGE_JAR=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT.jar
export PACKAGE_TEST_JAR=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT-tests.jar

function getSBTpaths {
    SCALADEPS=$(sbt --error "export compile:dependencyClasspath")
    echo $SCALADEPS
    SCALA_TEST_DEPS=$(sbt --error "export test:fullClasspath")
    echo $SCALA_TEST_DEPS
}

function buildScala {
    echo building project
    sbt "compile;test:compile;package;test:package"
}

# getSBTpaths
# buildScala
SCALA_TEST_DEPS=/opt/jemstep/code/scalatest-example/target/scala-2.12/test-classes:/opt/jemstep/code/scalatest-example/target/scala-2.12/classes:/opt/jemstep/code/scalatest-example/lib/scala-library-2.12.1.jar:/opt/jemstep/code/scalatest-example/lib/scalatest_2.12-3.0.5.jar:/Users/odendm/.sbt/boot/scala-2.12.10/lib/scala-library.jar:/Users/odendm/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest_2.12/3.0.5/scalatest_2.12-3.0.5.jar:/Users/odendm/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.12/3.0.5/scalactic_2.12-3.0.5.jar:/Users/odendm/Library/Caches/Coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6.jar:/Users/odendm/.sbt/boot/scala-2.12.10/lib/scala-reflect.jar

echo $SCALA_TEST_DEPS

# And then run tests:
TARGETDIR=./target/scala-2.12
TARGETPATH=$TARGETDIR/test-classes

# PROJECTCLASSES=$PACKAGE_JAR:$PACKAGE_TEST_JAR
PROJECTCLASSES=$PACKAGE_JAR

# DEPENDANCIES=$SCALATEST:$SCALACTIC:$PROJECTCLASSES
DEPENDANCIES=$SCALA_TEST_DEPS:$PROJECTCLASSES
# DEPENDANCIES=$SCALATEST:$SCALACTIC

# scala -classpath $SCALA_TEST_DEPS:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
# scala -classpath $SCALA_TEST_DEPS:$PACKAGE:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
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