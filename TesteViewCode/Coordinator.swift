//
//  Coordinator.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 05/10/21.
//

import Foundation
import UIKit

public enum ROUTER {
    case HOME
    case HOME_DETAIL
    case LOGIN
    case CUSTOM_SCREEN_PARAMS
    case REGISTRAR_ITEM
}


protocol Coordinator  {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    func start()
    func routingScreen( router : ROUTER )
    func routingScreen( router : ROUTER, viewController : UIViewController)
}
