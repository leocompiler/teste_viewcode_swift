//
//  HomeItemViewController.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 06/10/21.
//

import Foundation
import UIKit

final class HomeItem : UITableViewCell {
    
    var title : UILabel = { return UILabel(frame: .zero)}()
    var subTitle : UILabel = { return UILabel(frame: .zero)}()
    var iconImage : UIImageView = { return UIImageView(frame: .zero)}()
    
    func setUpCell() {
        
        subTitle.textAlignment =  .right
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(iconImage)
        
        
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        title.widthAnchor.constraint(equalToConstant: 40).isActive = true
        title.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        subTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10).isActive = true
        subTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        subTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        iconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
