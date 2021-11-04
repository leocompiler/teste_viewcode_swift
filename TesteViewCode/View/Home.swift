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
        let navigationController = route.navigationController
        
        super.init(nibName: nil, bundle: nil)
        navigationController.navigationItem.hidesBackButton = true
        navigationController.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(self.action(sender:)))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.title = "Fundos Imobiliarios"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.action(sender:)))
        
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.dataSource
        self.dataSource.data.addAndNotify( observer: self ) { [weak self] _ in
            self?.tableView.reloadData()
        }
        view.addSubview(tableView)
        tableView.register(HomeItemCell.self, forCellReuseIdentifier: "HomeItemCell")
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            
        ])
        
        self.viewModel.clickCellTableView( callback: { clickItens in
            print( clickItens)
            self.route?.routingScreen(router: ROUTER.CUSTOM_SCREEN_PARAMS, viewController: ItemDetail( viewModel: self.viewModel))
            
        })
        
        self.viewModel.fetch()
        
    }
    
    
    @objc func action(sender: UIBarButtonItem) {
        viewModel.showScreenItemRegister()
    }
    
}


