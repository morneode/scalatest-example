#!/bin/bash
export IVY2=/Users/odendm/.ivy2/cache
# export SCALATEST=$IVY2/org.scalatest/scalatest_2.11/bundles/scalatest_2.11-3.0.5.jar
# export SCALACTIC=$IVY2/org.scalactic/scalactic_2.11/bundles/scalactic_2.11-3.0.5.jar
# export SCALALIB=$IVY2/org.scala-lang/scala-library/jars/scala-library-2.11.12.jar
# export PACKAGE=/opt/jemstep/code/scalatest-example/target/scala-2.11/scalatest-example_2.11-0.1.0-SNAPSHOT.jar

export SCALATEST=$IVY2/org.scalatest/scalatest_2.12/bundles/scalatest_2.12-3.0.5.jar
export SCALACTIC=$IVY2/org.scalactic/scalactic_2.12/bundles/scalactic_2.12-3.0.5.jar
export SCALALIB=$IVY2/org.scala-lang/scala-library/jars/scala-library-2.12.1.jar
export PACKAGE=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT.jar
export PACKAGETEST=/opt/jemstep/code/scalatest-example/target/scala-2.12/scalatest-example_2.12-0.1.0-SNAPSHOT-tests.jar

export CLASSPATH=$SCALATEST:$SCALACTIC:$SCALALIB
# export CLASSPATH=$SCALATEST:$SCALACTIC:$SCALALIB:$PACKAGE