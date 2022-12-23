package com.example.fluternativebridge
import com.optisol.divinetoast.OptiToast

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channel = "flutter_native_bridging"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            if (call.method == "getToastMsg") {
               val successMsg = OptiToast.welcomeMsg(context,"Native Android")
                result.success(successMsg);
            } else {
                result.notImplemented()
            }
        }
    }
}
