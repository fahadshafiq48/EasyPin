//
//  EasyPinExample.swift
//  EasyPin_Example
//
//  Created by Fahad Shafiq on 07/03/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

@main
struct MainApp {
    static func main() {
        if #available(iOS 14.0, *) {
            EasyPinExample.main()
        } else {
//            UIApplicationMain(
//                CommandLine.argc,
//                UnsafeMutableRawPointer(CommandLine.unsafeArgv),
//                nil,
//                NSStringFromClass(SceneDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct EasyPinExample: App {
    var body: some Scene {
        WindowGroup {
            SetupPinVC() // Add another view with content Text("From iOS 14+") to test both block runs
        }
    }
}
