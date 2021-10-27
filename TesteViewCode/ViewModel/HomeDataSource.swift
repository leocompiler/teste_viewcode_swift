//
//  HomeDataSource.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 21/10/21.
//

import Foundation
import UIKit

class HomeDataSource : GenerecDataSource<[ItemModel]> , UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeItemCell", for: indexPath) as! HomeItemCell
        
        let value = self.data.value[indexPath.row]
        cell.item = value
        
        return cell
    }
    
   
}


extension HomeDataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = self.data.value[indexPath.row] as ItemModel
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        onSelectRowHandling!([item])

         
    }
}

