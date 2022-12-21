//
//  SkiClub_0_1App.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/20/22.
//

import SwiftUI
import GoogleSignIn

func application(
    _ app: UIApplication,
    open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    var handled: Bool

    handled = GIDSignIn.sharedInstance.handle(url)
    if handled {
      return true
    }
    return false
}


@main
struct SkiClub_0_1App: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if user == nil {
                            print(error as Any)
                        }
                    }
                }
                .environmentObject(network)
        }
    }
}

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
        if error != nil || user == nil {
            print("failed")
        } else {
           print("Success")
        }
    }
    return true
}
