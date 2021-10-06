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
//        let vc = ViewController.init()
//        navigationController.pushViewController(vc, animated: false)
        
        let viewModel = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
       
    }
    
    func routingScreen( router: ROUTER ){
        switch router {
        case ROUTER.HOME : return navigationController.pushViewController(HomeViewController(route: self ), animated: true)
         
        default:
            return navigationController.pushViewController(HomeViewController(route: self ), animated: true)
            
            
        }
        
    }
}
