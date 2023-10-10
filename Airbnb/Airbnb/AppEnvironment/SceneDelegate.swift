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
        let homeViewController = HomeViewController()
        let wishListViewController = WishListViewController()
        let reservationController = ReservationController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        wishListViewController.tabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(systemName: "heart"), tag: 0)
        reservationController.tabBarItem = UITabBarItem(title: "내 예약", image: UIImage(systemName: "person.fill"), tag: 0)
        
        tabBarController.setViewControllers(
            [homeViewController, wishListViewController, reservationController], animated: true
        )
        
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

