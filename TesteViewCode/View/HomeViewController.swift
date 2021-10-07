//
//  HomeViewController.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 05/10/21.
//

import Foundation
import UIKit

final class HomeViewController : UIViewController {
    
     
    
    private let model : Model?;
    
    lazy var titleScreen: UILabel = {
        let titleScreen = UILabel( frame: .zero)
        titleScreen.translatesAutoresizingMaskIntoConstraints = false
        return titleScreen
    }()
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    init( route: Coordinator) {
        self.model = nil
        super.init(nibName: nil, bundle: nil)
    }
    init( route: Coordinator,  viewModel : Model) {
        self.model = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}



extension HomeViewController: EmployeeViewModelDelegate {
    func reloadUI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EmployeeCell()
        cell.nameLabel.text = viewModel.name(at: indexPath.row)
        cell.cargoLabel.text = viewModel.cargo(at: indexPath.row)
        cell.photo.image = UIImage(named: viewModel.foto(at: indexPath.row))
        cell.setUpCell()

        return cell
    }


}
