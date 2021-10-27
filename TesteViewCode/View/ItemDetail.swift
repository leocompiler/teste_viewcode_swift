`    //
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
        
        
        iconImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        iconImage.backgroundColor = .red
        iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        myTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10).isActive = true
        
        myTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        subTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        
        subTitle.widthAnchor.constraint(equalToConstant: 125).isActive = true
        subTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
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

