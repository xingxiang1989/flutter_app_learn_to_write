package com.example.flutterapplearntowrite
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
//        setupMethodChannelLog()
        CustomFlutterPlugins.registerLogger(flutterEngine.dartExecutor)
    }

    private fun setupMethodChannelLog() {
        MethodChannel(flutterEngine?.dartExecutor, "android_log").setMethodCallHandler {
            methodCall, result ->
            val tag: String = methodCall.argument("tag") ?: ""
            val msg: String = methodCall.argument("msg") ?: ""
            when (methodCall.method) {
                "logV" -> Log.v(tag, msg)
                "logD" -> Log.d(tag, msg)
                "logI" -> Log.i(tag, msg)
                "logW" -> Log.w(tag, msg)
                "logE" -> Log.e(tag, msg)
                else -> Log.d(tag, msg)
            }
        }
    }

}
