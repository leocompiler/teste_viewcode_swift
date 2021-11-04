//
//  ItemRegisterViewModel.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 02/11/21.
//

import Foundation
final class ItemRegisterViewModel {
    
    private var coordinator: Coordinator
    
    typealias CompletionHandler = ( ([ItemModel])  -> Void)
    
    init( coordinator : Coordinator ) {
        self.coordinator = coordinator
    }
    
    
    
}
