//
//  MainCoordinator.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 05/10/21.
//

import UIKit
import Foundation


class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
       
    }
    
    func routingScreen( router: ROUTER ){
        switch router {
        case ROUTER.HOME : return navigationController.pushViewController(Home( self ), animated: true)
        case ROUTER.HOME_DETAIL: return navigationController.pushViewController(ItemDetail(), animated: true)
        default:
            return navigationController.pushViewController(Home( self ), animated: true)
            
            
        }
        
    }
}
