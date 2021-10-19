//
//  HomeViewController.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 05/10/21.
//

import Foundation
import UIKit

final class HomeViewController : UIViewController {
    
     
    
    private let viewModel : HomeViewModel?;
    
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
    
    init(_ route: Coordinator) {
        //example list Itens
        let item = ItemModel.init(title: "teste_1", subTile: "subTitle_1", iconImage: "https://picsum.photos/200")
        let arrayItens = [ item, item , item ]
        
        self.viewModel = HomeViewModel( coordinator: route , model: arrayItens )
        super.init(nibName: nil, bundle: nil)
    }
    init( route: Coordinator,  viewModel : HomeViewModel) {
        self.viewModel = viewModel
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
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive  = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
    }
}



extension HomeViewController: HomeViewDelegate {
    func reloadUI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate { }

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeItem()
         
        cell.title.text = self.viewModel?.title(at: indexPath.row)
        cell.subTitle.text = self.viewModel?.subTitle(at: indexPath.row)
         
        convertUrlToObjImage((self.viewModel?.iconImage(at: indexPath.row ))!, homeItem: cell )
        
        cell.setUpCell()

        return cell
    }
    
    
    func convertUrlToObjImage(_ urlImage : String , homeItem : HomeItem )  {
        let url = URL(string: urlImage)
 
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                homeItem.iconImage.image  = UIImage(data: data!)
            }

        }
        
 
    }

    
}
