package com.example.iguard

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.media.AudioManager
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.concetto.volume"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
             if (call.method == "getVolumeLevel" ){
                 val audio: AudioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
                 val currentVolume: Int = audio.getStreamVolume(AudioManager.STREAM_MUSIC)
                 val maxVolume: Int = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
                 val currentVolumeper= 100 * currentVolume/maxVolume;
//                 val percent = 0.7f
//                 val seventyVolume = (maxVolume * percent).toInt()
                result.success(currentVolumeper)
            }
            else {
                result.notImplemented()
            }
            // Note: this method is invoked on the main thread.
            // TODO
        }
    }
//
}
