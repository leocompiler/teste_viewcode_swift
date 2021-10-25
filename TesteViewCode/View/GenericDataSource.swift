//
//  GenericDataSource.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 21/10/21.
//

import Foundation


class GenerecDataSource<T> : NSObject {
    var data : DynamicValue<T> = DynamicValue([] as! T)
}
