//
//  HomeItemDetail.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 20/10/21.
//

import Foundation
import UIKit

final class ItemDetail : UIViewController {
    
    private let viewModel: HomeViewModel!
    
    
    
    init(viewModel: HomeViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    init(viewModel: HomeViewModel, dataSource : GenerecDataSource<HomeDataSource> ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    init(){
        self.viewModel = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var myTitle: UILabel = {
        let myTitle = UILabel(frame: .zero)
        myTitle.translatesAutoresizingMaskIntoConstraints = false
        return myTitle
    }()
    
    public lazy var subTitle: UILabel = {
        let subTitle = UILabel(frame: .zero)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    public lazy var iconImage: UIImageView = {
        let iconImage = UIImageView(frame: .zero)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contructComponentsScreen()
    }
    
    func contructComponentsScreen( index : Int = 0 ) {
        
        let item = viewModel.dataSource?.data.value[index]
        
        subTitle.textAlignment =  .left
        view.backgroundColor = .white
        view.addSubview(iconImage)
        view.addSubview(myTitle)
        view.addSubview(subTitle)
        
        iconImage.backgroundColor = .red
        //myTitle.backgroundColor = .transpa
        //subTitle.backgroundColor = .black
        
        let area = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            iconImage.leadingAnchor.constraint(equalTo: area.leadingAnchor ),
            iconImage.topAnchor.constraint(equalTo: area.topAnchor ),
            
            iconImage.widthAnchor.constraint(equalTo: area.widthAnchor ),
            iconImage.heightAnchor.constraint(equalTo: area.widthAnchor ),
            
            
            myTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 1),
            myTitle.leadingAnchor.constraint(equalTo: area.leadingAnchor),
            myTitle.widthAnchor.constraint(equalTo: area.widthAnchor ),
            //myTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            subTitle.topAnchor.constraint(equalTo: myTitle.bottomAnchor ),
            subTitle.leadingAnchor.constraint(equalTo: area.leadingAnchor),
            subTitle.widthAnchor.constraint(equalTo: area.widthAnchor ),
            //subTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            
        ])
        
        myTitle.text = item?.title
        subTitle.text = item?.subTile
        convertUrlToObjImage(item!.iconImage)
    }
    
}

extension ItemDetail  {
    private func convertUrlToObjImage(_ urlImage : String  )  {
        let url = URL(string: urlImage)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                
                guard let tempImage = UIImage(data: data!)
                else  {
                    print("Erro UIImage create")
                    return
                }
                self.iconImage.image  = tempImage
            }
            
        }
        
        
    }
}

