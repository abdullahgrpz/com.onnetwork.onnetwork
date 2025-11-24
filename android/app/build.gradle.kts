// android/app/build.gradle.kts (TAM VE İMZALAMAYA HAZIR KOD)

// --- YENİ EKLENDİ (Dosya okumak için) ---
import java.io.FileInputStream
import java.util.Properties
// --- BİTTİ ---

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// --- YENİ EKLENDİ (key.properties dosyasını okuma) ---
// Bu dosya (build.gradle.kts) 'android/app/' içindedir.
// key.properties dosyası 'android/' içindedir.
// rootProject.file("key.properties") 'android/key.properties' yolunu doğru bulur.
val keyPropertiesFile = rootProject.file("key.properties")
val keyProperties = Properties()
if (keyPropertiesFile.exists()) {
    keyProperties.load(FileInputStream(keyPropertiesFile))
}
// --- BİTTİ ---


android {
    namespace = "com.onnetwork.on_network"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    // --- YENİ EKLENDİ (İmzalama Yapılandırması) ---
    signingConfigs {
        create("release") {
            keyAlias = keyProperties["keyAlias"] as String?
            keyPassword = keyProperties["keyPassword"] as String?
            // storeFile yolu 'key.properties' dosyasından okunur ('app/keystore.jks')
            // rootProject.file() bunu 'android/app/keystore.jks' olarak doğru çözer.
            storeFile = if (keyProperties["storeFile"] != null) rootProject.file(keyProperties["storeFile"] as String) else null
            storePassword = keyProperties["storePassword"] as String?
        }
    }
    // --- BİTTİ ---

    defaultConfig {
        applicationId = "com.onnetwork.on_network"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
        // coreLibraryDesugaringEnabled, compileOptions bloğuna taşındı
    }

    buildTypes {
        release {
            // --- DÜZELTİLDİ: Artık debug değil, release imzasını kullanacak ---
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM (Bill of Materials) ekleniyor.
    // Bu, tüm Firebase kütüphanelerinin uyumlu sürümlerini yönetir.
    implementation(platform("com.google.firebase:firebase-bom:33.1.0"))
    implementation("com.google.firebase:firebase-analytics")

    // Bu satırın yeri ve syntax'ı doğruydu
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
