//
//  HomeViewController.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 05/10/21.
//

import Foundation
import UIKit

final class Home : UIViewController {
    
    
    let dataSource = HomeDataSource()
    
    private var viewModel : HomeViewModel
    let route : Coordinator?
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    init(_ route: Coordinator) {
        self.route = route
        self.viewModel =  HomeViewModel( coordinator: route, dataSource: dataSource)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.title = "Fundos Imobiliarios"
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.dataSource
        self.dataSource.data.addAndNotify( observer: self ) { [weak self] _ in
            self?.tableView.reloadData()
        }
        view.addSubview(tableView)
        tableView.register(HomeItemCell.self, forCellReuseIdentifier: "HomeItemCell")
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive  = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        
        self.viewModel.clickCellTableView( callback: { clickItens in
            print( clickItens)
            self.route?.routingScreen(router: ROUTER.CUSTOM_SCREEN_PARAMS, viewController: ItemDetail( viewModel: self.viewModel))
            
        })
        
        self.viewModel.fetch()
        
    }
    
}


