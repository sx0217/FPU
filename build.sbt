scalaVersion := "2.13.10"

scalacOptions ++= Seq(
  "-feature",
  "-language:reflectiveCalls",
)

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin_2.13.10" % "3.5.5")
libraryDependencies ++= Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.5.6",
  "edu.berkeley.cs" %% "chiseltest" % "0.5.3",
  "edu.berkeley.cs" %% "hardfloat" % "1.5-SNAPSHOT"
)
resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases"),
  Resolver.mavenLocal)
