//
//  HomeViewModel.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 07/10/21.
//

import Foundation
import UIKit

struct HomeViewModel {
    
    private let coordinator: Coordinator
    weak var dataSource : GenerecDataSource<[ItemModel]>?
    typealias CompletionHandler = ( ([ItemModel])  -> Void)
    
    
    
    init( coordinator : Coordinator , dataSource : GenerecDataSource<[ItemModel]> ) {
        self.coordinator = coordinator
        self.dataSource = dataSource
    }
    
    func fetch() {
        
        let arrayItens = [
            ItemModel.init(title: "Povos", subTile: "marinhos", iconImage: "https://picsum.photos/200"),
            ItemModel.init(title: "Dogs", subTile: "terrestres", iconImage: "https://picsum.photos/200") ,
            ItemModel.init(title: "Cats", subTile: "terrestres", iconImage: "https://picsum.photos/200")
        ]
        self.dataSource?.data.value = arrayItens
        
    }
    
    func clickCellTableView( callback : @escaping CompletionHandler ) {
        self.dataSource?.onSelectRowHandling = callback
    }
}
