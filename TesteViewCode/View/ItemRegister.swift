//
//  ItemRegister.swift
//  TesteViewCode
//
//  Created by LEONARDO A SILVEIRA on 01/11/21.
//

import Foundation
import UIKit



final class ItemRegister : UIViewController {
    
    var viewModel: ItemRegisterViewModel?
    
    private lazy var questionLabel = UILabel()
    
    
    private lazy var cepTextField = UITextField()
    private lazy var logradouroTextField =  UITextField()
    private lazy var numeroTextField =  UITextField()
    private lazy var complementoTextField =  UITextField()
    private lazy var bairroTextField =  UITextField()
    private lazy var cidadeTextField =  UITextField()
    private lazy var estadoTextField =  UITextField()
    
    private lazy var stackView : UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.addSubview(cepTextField)
        view.addSubview(logradouroTextField)
        view.addSubview(numeroTextField)
        view.addSubview(bairroTextField)
        view.addSubview(cidadeTextField)
        view.addSubview(estadoTextField)
    }()
    
    private lazy var registerButton = UIButton()
    private lazy var cancelButton = UIButton()
    
    init( _ route : Coordinator ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = ItemRegisterViewModel(coordinator: route)
        
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        super.title = "Registrar"
        
        //let stackView = UIStackView(arrangedSubviews: [nomeLabel,nomeTextField,enderecoLabel,enderecoTextField,registrarButton])
        //stackView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        //config
        //stackView.axis = .vertical
        
        
        //view.addSubview(stackView)
        
        configComponents()
        
        
        view.addSubview(question)
        view.addSubview()
        
        
//        view.addSubview(enderecoTextField)
 
 
        
        
    }
    
    private func configComponents(){
        
        questionLabel.text = "Onde você mora ?"
        questionLabel.textAlignment = .center
        //nomeLabel.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        questionLabel.textColor = .black
        
        
        logradouroTextField.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0.25)
        logradouroTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        logradouroTextField.placeholder = "Digite o logradouro..."
        logradouroTextField.textAlignment = .left
        logradouroTextField.autocapitalizationType = .none
        logradouroTextField.layer.cornerRadius = 10
        
        numeroTextField.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 0.25)
        numeroTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        numeroTextField.placeholder = "Digite a numero..."
        numeroTextField.textAlignment = .left
        numeroTextField.autocapitalizationType = .none
        numeroTextField.layer.cornerRadius = 10
        
        
        
        
        registerButton.setTitle("Próximo", for: .normal)
        registerButton.backgroundColor = .red
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(registrar), for: .touchDown)
        
        registerButton.setTitle("Anterior", for: .normal)
        registerButton.backgroundColor = .red
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(cancelar), for: .touchDown)
        
        NSLayoutConstraint.activate([
            
            questionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            nomeTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            nomeTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor ),
            nomeTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            enderecoTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            enderecoTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            enderecoTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //registrarButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            cancelButton.heightAnchor.constraint(equalToConstant: 40 )
            
        ])
    }
    
    @objc private func registrar() {
        print("register...save")
    }
    @objc private func cancelar() {
        print("register...save")
    }
    
}
