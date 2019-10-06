lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.example",
      scalaVersion := "2.12.10"
    )),
    name := "scalatest-example"
  )

libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % Test

// assemblyOption in (Compile, assembly) := (assemblyOption in (Compile, assembly)).value.copy(includeScala = false)

// Project.inConfig(Test)(baseAssemblySettings)

// test in (Test, assembly) := {}

// assemblyOption in (Test, assembly) := (assemblyOption in (Test, assembly)).value.copy(includeScala = false, includeDependency = true)

// assemblyJarName in (Test, assembly) := s"${name.value}-test.jar"

// fullClasspath in (Test, assembly) := {
//   val cp = (fullClasspath in Test).value
//   cp.filter{ file =>
//     (file.data.name contains "classes") ||
//     (file.data.name contains "test-classes") ||
//     // sorta hacky
//     (file.data.name contains "play")
//   }  ++  (fullClasspath in Runtime).value
// }

// assemblyMergeStrategy in assembly := {
//   case PathList("javax", "servlet", xs @ _*)         => MergeStrategy.first
//   case PathList(ps @ _*) if ps.last endsWith ".html" => MergeStrategy.first
//   case "application.conf"                            => MergeStrategy.concat
//   case "unwanted.txt"                                => MergeStrategy.discard
//   case x =>
//     val oldStrategy = (assemblyMergeStrategy in assembly).value
//     oldStrategy(x)
// }