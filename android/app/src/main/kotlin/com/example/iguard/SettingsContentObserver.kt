package com.example.iguard

import android.content.Context
import android.database.ContentObserver
import android.media.AudioManager
import android.util.Log

import android.os.Handler
import android.view.Display

class SettingsContentObserver(context: Context, handler: Handler, private val volume: VolumeInterface) : ContentObserver(handler) {

    private val audioManager: AudioManager
    override fun deliverSelfNotifications(): Boolean {
        return false
    }

    override fun onChange(selfChange: Boolean) {
        val currentVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC)
        Log.d("Volume", "Current Volume $currentVolume")
        volume.display(currentVolume)


    }

    init {
        audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    }

}

