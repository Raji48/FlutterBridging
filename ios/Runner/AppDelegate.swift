import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//      let batteryChannel = FlutterMethodChannel(name: "flutter_native_bridging",
//                                                binaryMessenger: controller.binaryMessenger)
//
      setUpMethodChannels(controller: controller)

//      batteryChannel.setMethodCallHandler({
//        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//
////          result("call ios")
//        // This method is invoked on the UI thread.
//        // Handle battery messages.
//      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func setUpMethodChannels(controller: FlutterViewController) {

         let contactChannel = FlutterMethodChannel(name: "com.example.iosbrigdingapp",
                                                   binaryMessenger: controller.binaryMessenger)
         let viewfactory = FLNativeViewFactory()
         registrar(forPlugin: "com.example.iosbrigdingapp")!.register(viewfactory, withId: "FlutterView")


         contactChannel.setMethodCallHandler({
               (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in


             })
         }
}
