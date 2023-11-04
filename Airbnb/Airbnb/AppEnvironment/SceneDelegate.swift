//
//  SceneDelegate.swift
//  Airbnb
//
//  Created by Jason on 10/7/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let tabBarController = UITabBarController()
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let wishListViewController = UINavigationController(rootViewController: WishListViewController())
        let reservationController = UINavigationController(rootViewController: ReservationController())
        let loginViewController = LoginViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        wishListViewController.tabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(systemName: "heart"), tag: 1)
        reservationController.tabBarItem = UITabBarItem(title: "내 예약", image: UIImage(systemName: "person.fill"), tag: 2)
        loginViewController.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
        
        tabBarController.setViewControllers(
            [homeViewController, wishListViewController, reservationController, loginViewController], animated: true
        )
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGray6
            appearance.stackedLayoutAppearance.selected.iconColor = .black
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = tabBarController.tabBar.standardAppearance
        } else {
            tabBarController.tabBar.tintColor = .systemGray6
            tabBarController.tabBar.barTintColor = .systemGray6
        }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        if url.absoluteString.starts(with: "ios-airbnb://") {
            if let code = url.absoluteString.split(separator: "=").last.map({ String($0) }) {
                LoginManager.shared.requestAccessTokenToGitHub(with: code)
            }
        } else {
            print(url)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

