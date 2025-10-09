pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    // Flutter plugin loader
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"

    // Android Gradle Plugin
    id("com.android.application") version "8.7.0" apply false

    // Firebase / Google Services
    id("com.google.gms.google-services") version "4.3.15" apply false

    // Kotlin Plugin (compatible with AGP 8.7.x)
    id("org.jetbrains.kotlin.android") version "1.9.24" apply false
}

include(":app")
