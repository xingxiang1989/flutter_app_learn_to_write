package com.example.flutterapplearntowrite
import android.content.Intent
import android.text.TextUtils
import android.util.Log
import com.example.flutterapplearntowrite.Constant.AUTHORIZATION_CODE
import com.example.flutterapplearntowrite.Constant.SHARED_CHANNEL_NAME
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {


    var mAuthorizationCode: String?= null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        CustomFlutterPlugins.registerLogger(flutterEngine.dartExecutor)

        MethodChannel(flutterEngine.dartExecutor, SHARED_CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == CustomFlutterPlugins.CALL_LOGIN_CODE && !TextUtils.isEmpty(mAuthorizationCode)) {
                result.success(mAuthorizationCode)
                mAuthorizationCode = null
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        Log.d("MainActivity", "onNewIntent")
        getExtra(intent)
        Log.d("MainActivity", "onNewIntent mAuthorizationCode = $mAuthorizationCode")

    }

    private fun getExtra(intent: Intent?) {
        // from author login
        mAuthorizationCode = intent?.data?.getQueryParameter(AUTHORIZATION_CODE)
    }
}
