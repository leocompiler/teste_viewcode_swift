//
//  ItemViewModel.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 20/10/21.
//

import Foundation


final class ItemViewModel {
    
    private let model : ItemModel
    
    init(_ m : Model ) {
        self.model = m as! ItemModel
        
    }
    
    public func getItem() -> Model{
        return self.model
    }
}
