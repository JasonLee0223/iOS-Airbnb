//
//  SearchDataSource.swift
//  Airbnb
//
//  Created by Jason on 10/25/23.
//

import UIKit

final class SearchDataSource: NSObject, UITableViewDataSource {
    
    private var items: [Destination]
    
    init(items: [Destination]) {
        self.items = items
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelListCell.identifier, 
                                                       for: indexPath) as? TravelListCell else {
            return UITableViewCell()
        }
        
//        let item = Destination(name: <#T##String#>, distance: <#T##String#>, imageName: <#T##String#>)
//        cell.configureItems(<#T##Destination#>)
        return UITableViewCell()
    }
}
