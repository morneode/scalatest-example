#!/bin/bash
# https://stackoverflow.com/questions/22075534/how-do-i-set-the-classpath-when-using-the-scalatest-runner

source variables.sh

# ACCEPTANCE=/opt/jemstep/code/stormsend/stormsend-acceptance/target/scala-2.11/stormsend-acceptance_2.11-1.0.jar

#scala -classpath $ACCEPTANCE  -classpath $SCALATEST org.scalatest.tools.Runner -p compiled_tests
# scala -classpath $SCALATEST  org.scalatest.tools.Runner -p compiled_tests

# And then run tests:
JARFILE=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT-tests.jar
TARGETDIR=./target/scala-2.12
TARGETPATH=$TARGETDIR/test-classes

# PROJECTCLASSES=$PACKAGE:$PACKAGETEST
PROJECTCLASSES=$PACKAGE

# DEPENDANCIES=$SCALATEST:$SCALACTIC:$PROJECTCLASSES
DEPENDANCIES=$DEPSTEST:$PROJECTCLASSES
# DEPENDANCIES=$SCALATEST:$SCALACTIC

# scala -classpath $DEPSTEST:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
# scala -classpath $DEPSTEST:$PACKAGE:$JARFILE org.scalatest.tools.Runner -R $JARFILE -o -s CubeCalculatorTest
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST org.scalatest.tools.Runner -R -o -s CubeCalculatorTest
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGETEST:$PACKAGE org.scalatest.tools.Runner -R $PACKAGETEST -o -s CubeCalculatorTest
# scala -cp $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST org.scalatest.tools.Runner -R $PACKAGETEST -o -s CubeCalculatorTest
echo running the tests one-by-one
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -o -s CubeCalculatorTest;
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -o -s ExampleSpec;
echo running all in path
scala -classpath $DEPENDANCIES org.scalatest.tools.Runner -R $TARGETPATH -o;

# $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST
# scala -classpath $SCALATEST:$SCALACTIC:$PACKAGE:$PACKAGETEST org.scalatest.tools.Runner -R $PACKAGETEST -o -s CubeCalculatorTest
# `scala -J-Xmx4G -J-Xms4G -cp “/home/neil/.ivy2/cache/org.scalatest/scalatest_2.11/bundles/scalatest_2.11-2.2.6.jar:./target/scala-2.11/neatapp-assembly-0.1-SNAPSHOT_shrunk.jar:./target/scala-2.11/neatapp_2.11-0.1-SNAPSHOT-tests.jar” org.scalatest.run org.activeintel.MySpec`