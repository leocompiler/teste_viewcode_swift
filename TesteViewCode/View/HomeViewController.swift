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
    public lazy var titleScreen: UILabel = {
        let titleScreen = UILabel( frame: .zero)
        titleScreen.translatesAutoresizingMaskIntoConstraints = false
        return titleScreen
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
    
}
