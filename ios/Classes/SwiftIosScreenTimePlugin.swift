import Flutter
import UIKit
import FamilyControls
import ManagedSettings

@available(iOS 15.0, *)
public class SwiftIosScreenTimePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "ios_screen_time_tools", binaryMessenger: registrar.messenger())
        let instance = SwiftIosScreenTimePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "requestScreenTimePermission":
            requestPermission(result: result)
        case "hasScreenTimePermission":
            checkPermission(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func requestPermission(result: @escaping FlutterResult) {
        let center = AuthorizationCenter.shared
        
        Task {
            do {
                try await center.requestAuthorization(for: .individual)
                result(true)
            } catch {
                result(FlutterError(code: "AUTH_ERROR",
                                  message: error.localizedDescription,
                                  details: nil))
            }
        }
    }
    
    private func checkPermission(result: @escaping FlutterResult) {
        let center = AuthorizationCenter.shared
        result(center.authorizationStatus == .approved)
    }
} 