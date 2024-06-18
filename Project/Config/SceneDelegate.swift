//
//  SceneDelegate.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import UIKit
@_exported import Combine
@_exported import RswiftResources

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var appCoordinator: Coordinator?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        LocalizationManager.shared.delegate = self
        LocalizationManager.shared.setLanguage(language: .english)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
}

extension SceneDelegate: LocalizationDelegate {
    func resetAppAfterChangeLanguge() {
        guard let window = window else { return }
        let appCoordinator = AppCoordinator(window: window, navigationController: UINavigationController())
        
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }
    
    func resetAppFromTabBar() {
        
    }
    
}
