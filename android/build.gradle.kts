allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            val g = requested.group
            val n = requested.name
            val v = requested.version
            if (g == "androidx.fragment" && n == "fragment" && v != null && v.startsWith("1.7")) {
                useVersion("1.6.2")
            }
            if (g == "androidx.activity" && n == "activity" && v != null && v.startsWith("1.8")) {
                useVersion("1.7.2")
            }
            if (g == "androidx.core" && n == "core" && v != null && (v.startsWith("1.13") || v.startsWith("1.12"))) {
                useVersion("1.10.1")
            }
            if (g == "androidx.core" && n == "core-ktx" && v != null && (v.startsWith("1.13") || v.startsWith("1.12"))) {
                useVersion("1.10.1")
            }
            if (g == "androidx.lifecycle" && v != null && v.startsWith("2.7")) {
                useVersion("2.6.2")
            }
            if (g == "androidx.window" && v != null && v.startsWith("1.2")) {
                useVersion("1.1.0")
            }
            if (g == "androidx.annotation" && n == "annotation-experimental" && v != null && v.startsWith("1.4")) {
                useVersion("1.3.1")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
