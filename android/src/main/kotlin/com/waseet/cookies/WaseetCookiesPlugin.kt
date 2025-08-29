<<<<<<< HEAD:android/src/main/kotlin/com/example/waseet_cookies/WaseetCookiesPlugin.kt
package com.waseet.cookies  // ← لازم يطابق المسار و"package" في pubspec

import android.os.Handler
import android.os.Looper
import android.webkit.CookieManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class WaseetCookiesPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "waseetpro/cookies")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "getCookies" -> {
        val url = call.argument<String>("url")
        if (url.isNullOrBlank()) { result.error("NO_URL", "الرابط غير صالح", null); return }
        Handler(Looper.getMainLooper()).post {
          val cm = CookieManager.getInstance()
          val raw = cm.getCookie(url)
          if (raw == null) result.error("NO_COOKIES", "لم يتم العثور على أي كوكيز", null)
          else result.success(raw)
        }
      }
      "clearCookies" -> {
        Handler(Looper.getMainLooper()).post {
          val cm = CookieManager.getInstance()
          cm.removeAllCookies { ok ->
            cm.flush()
            result.success(ok)
          }
        }
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
=======
package com.waseet.cookies  // ← لازم يطابق المسار و"package" في pubspec

import android.os.Handler
import android.os.Looper
import android.webkit.CookieManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class WaseetCookiesPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "waseetpro/cookies")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "getCookies" -> {
        val url = call.argument<String>("url")
        if (url.isNullOrBlank()) { result.error("NO_URL", "الرابط غير صالح", null); return }
        Handler(Looper.getMainLooper()).post {
          val cm = CookieManager.getInstance()
          val raw = cm.getCookie(url)
          if (raw == null) result.error("NO_COOKIES", "لم يتم العثور على أي كوكيز", null)
          else result.success(raw)
        }
      }
      "clearCookies" -> {
        Handler(Looper.getMainLooper()).post {
          val cm = CookieManager.getInstance()
          cm.removeAllCookies { ok ->
            cm.flush()
            result.success(ok)
          }
        }
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
>>>>>>> 9512c71 (Fix: ensure plugin main class path + pubspec plugin block):android/src/main/kotlin/com/waseet/cookies/WaseetCookiesPlugin.kt
