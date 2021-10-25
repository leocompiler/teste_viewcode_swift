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
        self.viewDidLoad()
        contructComponentsScreen()
    }
    
    func contructComponentsScreen() {
        
        subTitle.textAlignment =  .right
        view.addSubview(iconImage)
        view.addSubview(myTitle)
        view.addSubview(subTitle)
        
        
        iconImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        myTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10).isActive = true
        myTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        subTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        subTitle.widthAnchor.constraint(equalToConstant: 125).isActive = true
        subTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
