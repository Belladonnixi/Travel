//
//  SceneDelegate.swift
//  Travel
//
//  Created by Jessica Ernst on 02.09.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var appUser : [String:String]? = [
        "name": "Jessi",
        "password": "abcd",
        "email": "something@something.com",
        "id": "1"
    ]

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if appUser != nil {
            // if user is logged in go to the tab controller
            // setMainTabBarController as the root view
            let mainTB = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            
            // passing id and name of logged in app user to the tabBar
            mainTB.userId = Int(appUser?["id"] ?? "0")
            mainTB.userName = String(appUser?["name"] ?? "something")
            mainTB.email = String(appUser?["email"] ?? "something")
            window?.rootViewController = mainTB
            window?.makeKeyAndVisible()
        } else {
            // user isn't logged in, take the user to LoginNavigationController
            let loginNC = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
            window?.rootViewController = loginNC
            window?.makeKeyAndVisible()
        }
    }
    
    func setRootViewController(_ vc: UIViewController, _ userId: Int? = nil, _ userName: String? = nil, _ email: String? = nil) {
        if let window = self.window {
            // if we are logging in, pass the userId
            if let mainTb = vc as? MainTabBarController {
                mainTb.userId = userId
                mainTb.userName = userName
                mainTb.email = email
            }
            window.rootViewController = vc
            
            // adding animation
            UIView.transition(with: window,
                              duration: 0.8,
                              options: .transitionCurlDown,
                              animations: nil)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

