package com.example.wallpaper

import android.app.WallpaperManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.IOException


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.wallpaper/wallpaper")
            .setMethodCallHandler { call, result ->
                val setWallpaper = setWallpaper(call.arguments as String)
                if (setWallpaper ==0) {
                    result.success(setWallpaper);
                } else {
                    result.error("UNAVAILABLE", "", null);
                }
            }
    }

    private fun setWallpaper(path: String): Int {
        var setWallpaper = 1
        val imgFile = File(path)
        // set bitmap to wallpaper
        val bitmap: Bitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath())
        var wm: WallpaperManager? = null
        //if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
        wm = WallpaperManager.getInstance(this)
        // }
        setWallpaper = try {
            // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
            wm.setBitmap(bitmap)
            //  }
            0
        } catch (e: IOException) {
            1
        }
        return setWallpaper
    }
}
