//
//  AppDelegate.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 10/29/22.
//

import UIKit

// TODO: Pt 1 - Import Parse Swift
import ParseCore
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // TODO: Pt 1 - Initialize Parse SDK
        // https://github.com/parse-community/Parse-Swift/blob/main/ParseSwift.playground/Sources/Common.swift
        
        // Initialize ParseSwift
        if let appID = Bundle.main.object(forInfoDictionaryKey: "BACK4APP_APP_ID") as? String,
           let clientKey = Bundle.main.object(forInfoDictionaryKey: "BACK4APP_CLIENT_KEY") as? String {
            
            ParseSwift.initialize(
                applicationId: appID,
                clientKey: clientKey,
                serverURL: URL(string: "https://parseapi.back4app.com")!
            )
        } else {
            print("⚠️ Missing Back4App credentials in Info.plist")
        }
        

        // TODO: Pt 1: - Instantiate and save a test parse object to your server
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L121
//        // Define a Parse Object
//        struct GameScore: ParseObject {
//            var originalData: Data?
//            
//            // Required fields
//            var objectId: String?
//            var createdAt: Date?
//            var updatedAt: Date?
//            var ACL: ParseACL?
//            
//            // Custom fields
//            var score: Int?
//            var playerName: String?
//            var cheatMode: Bool?
//        }
//        
//        // Save a test object
//        Task {
//            var gameScore = GameScore()
//            gameScore.score = 5000
//            gameScore.playerName = "Kingsley 🐶"
//            gameScore.cheatMode = true
//            
//            do {
//                try await gameScore.save()
//                print("👩‍🔬✅ SUCCESS! Parse object saved")
//            } catch {
//                print("👩‍🔬❌ Error saving Parse object: \(error)")
//            }
//        }


        return true
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

// TODO: Pt 1 - Create Test Parse Object
// https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L33


