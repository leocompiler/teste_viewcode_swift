//
//  HomeItemViewController.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 06/10/21.
//

import Foundation
import UIKit

final class HomeItem : UITableViewCell {
    
 
        public lazy var title: UILabel = {
           let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
           return title
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
    
    
    
    func setUpCell() {
        
        subTitle.textAlignment =  .right
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(iconImage)
        
        
        iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        title.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10).isActive = true
        title.widthAnchor.constraint(equalToConstant: 200).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        subTitle.widthAnchor.constraint(equalToConstant: 125).isActive = true
        subTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
