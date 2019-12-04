//
//  AppDelegate.swift
//  SignInTest
//
//  Created by Martin Bergendorff on 2019-12-04.
//  Copyright © 2019 Martin Bergendorff. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().clientID = "120371256474-h0c6603ngp7uj6trdkb1b9jiilac5ddm.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    
    // Google Sign in methods
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return (GIDSignIn.sharedInstance().handle(url as URL?))
    }
    
//     func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("Sign in function")
//
//        if let error = error {
//            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//                print("User logged out or has not signed in before.")
//            } else {
//                let userId = user.userID                  // For client-side use only!
//                let idToken = user.authentication.idToken // Safe to send to the server
//                let fullName = user.profile.name
//                let givenName = user.profile.givenName
//                let familyName = user.profile.familyName
//                let email = user.profile.email
//
//                print("Succesfully signed in: \(email!)")
//            }
//        }
//     }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        print(error)
        return
      }

        guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        print("Signed in \(credential.provider)")
        Auth.auth().signIn(with: credential) { (authresult, error) in
            if(error != nil) {
                print("Error signing in: \(error!)")
            } else {
                print("Signed in..")
                print(authresult?.credential?.provider)
            }
            
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("Error when disconnecting: \(error)")
        } else {
            print("Disconnected successfully")
            
        }
    }
    
    
        
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

