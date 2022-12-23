//
//  FlutterView.swift
//  Runner
//
//  Created by MAC-OBS-49 on 23/12/22.
//

//import Foundation
import Flutter
import UIKit
//import mediapipe_ios

public class FLNativeView: NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewid:Int64
    

    init(_
        frame: CGRect,
        viewId: Int64,
         args: Any?
    ){
        self.frame = frame
        self.viewid = viewId
    }

   public func view() -> UIView {
//       guard let cameraView  = controller.view else { return false }
//       var cameraManager: CameraManager? = CameraManager(cameraView)
       //var cameraView: UIView!
       //var cameraManager: CameraManager? = CameraManager(cameraView)
       //self.cameraManager?.startSession()
     //  return  CameraManager(frame:frame)  //
       return  UISlider(frame: frame)
    }

}



public class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {

   public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
             frame,
             viewId: viewId,
            args: args
            )
    }
}
