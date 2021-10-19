//
//  HomeViewModel.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 07/10/21.
//

import Foundation
import UIKit

protocol HomeViewDelegate: class {
    func reloadUI()
}
final class HomeViewModel {
    
    private let coordinator: Coordinator
    private var model: [ItemModel]

    weak var delegate : HomeViewDelegate?
    
    init( coordinator : Coordinator , model : [ItemModel] ) {
        self.coordinator = coordinator
        self.model = model
    }
    
    
    //-- funcs for detail item array
    
    public func numberOfRows() -> Int {
        return model.count
    }
    
    public func title(at index:Int ) -> String {
        return model[index].title
    }

    public func subTitle(at index:Int ) -> String {
        return model[index].subTile
    }
    public func iconImage( at index:Int) -> String{
        return model[index].iconImage
    }
    
    

}
