package com.example.flutterapplearntowrite

import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel


/**
 * @author xiangxing
 */
object CustomFlutterPlugins {
    //这里必选要跟Flutter平台名称对应上，否则无法接收消息
    private val LOG_CHANNEL_NAME = "android_log"

    public fun registerLogger(messenger: BinaryMessenger?) {
        MethodChannel(messenger, LOG_CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
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