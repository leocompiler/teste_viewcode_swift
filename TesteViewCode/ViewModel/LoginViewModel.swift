//
//  LoginViewModel.swift
//  CassCompany
//
//  Created by Cassia Aparecida Barbosa on 24/03/20.
//  Copyright © 2020 CassCompanyTeam. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func reject()
}

final class LoginViewModel {

    private let coordinator: Coordinator
    private var model: LoginModel

    weak var delegate: LoginViewModelDelegate?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        self.model = LoginModel(login: "", password: "")
    }

    public var password: String = ""
    public var login: String = ""

    public func presentEmployeesScreen() {
        if password == "admin" && login == "admin" {
            coordinator.routingScreen(router : ROUTER.HOME )
        } else {
            delegate?.reject()
        }
    }
}

