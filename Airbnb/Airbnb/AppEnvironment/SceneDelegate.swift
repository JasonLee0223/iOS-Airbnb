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
        
        homeViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        wishListViewController.tabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(systemName: "heart"), tag: 1)
        reservationController.tabBarItem = UITabBarItem(title: "내 예약", image: UIImage(systemName: "person.fill"), tag: 2)
        
        tabBarController.setViewControllers(
            [homeViewController, wishListViewController, reservationController], animated: true
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

