package com.example.iguard

import android.content.Context
import android.media.AudioManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log

class MainActivity : FlutterActivity() {
    private lateinit var channel: MethodChannel
    private val CHANNEL = "com.concetto.volume"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
       channel= MethodChannel(
            flutterEngine?.dartExecutor?.binaryMessenger,
            CHANNEL
        )
        val handler = Handler(Looper.getMainLooper())
        val volume = object: VolumeInterface{
            override fun display(count: Int) {
                Log.d("MainActivity"," latest $count%")
                channel.invokeMethod("entry", count )
            }
        }
        val contentObserver: SettingsContentObserver = SettingsContentObserver(
            this,
            handler,
            volume
        )
        contentResolver.registerContentObserver(
            android.provider.Settings.System.CONTENT_URI, true, contentObserver
        );
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getVolumeLevel") {
                val audio: AudioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
                val currentVolume: Int = audio.getStreamVolume(AudioManager.STREAM_MUSIC)
                val maxVolume: Int = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
                val currentVolumeper = 100 * currentVolume / maxVolume;
                result.success(currentVolumeper)
            } else {
                result.notImplemented()
            }

        }
    }


}




