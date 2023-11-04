//
//  LoginManager.swift
//  Airbnb
//
//  Created by Jason on 11/2/23.
//

import UIKit

final class LoginManager {
    
    static let shared = LoginManager()
    
    private init() {}
    private let client_id = "5136c82633a1f534b18d"
    private let client_secret = "b9c42bf558fec966413d988451a77bfc1335dcaa"
    
    func requestCodeToGithub() {
        let scope = "repo,user"                         // repo와 user 매개변수에 접근하겠다는 명시
        let urlString = "http://github.com/login/oauth/authorize?client_id=\(client_id)&scope=\(scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            // redirect to scene(_:openURLContexts:) if user authorized
            UIApplication.shared.open(url)
        }
    }
    
    func getUser(accessToken: String) {
        print("My AccessToken = \(accessToken)")
        guard let url = URL(string: "https://api.github.com/user") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(
            with: request as URLRequest, completionHandler: { data, response, error in
                guard let data = data else {
                    return
                }
                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print(String(data: data, encoding: .utf8) ?? "Not String!!")
                    return
                }
                print(json["avatar_url"] as Any)
                print(json["name"] as Any)
            })
        task.resume()
    }
    
    func requestAccessTokenToGitHub(with code: String) {
        guard let url = URL(string: "https://github.com/login/oauth/access_token") else { return }
        let parameters = ["client_id": client_id, 
                          "client_secret": client_secret,
                          "code": code]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(
            with: request as URLRequest, completionHandler: { data, response, error in
                guard let data = data else { return }
                print(data)
                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print(String(data: data, encoding: .utf8) ?? "Not String!")
                    return
                }
                self.getUser(accessToken: json["access_token"] as! String)
            })
        task.resume()
    }
}

