//
//  ViewController.swift
//  Movies
//
//  Created by Facundo Lanùs on 14/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//
/* Si cambio:
 
 class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
 
 por
 
 class HomeViewController: UINavigationController, UITableViewDataSource, UITableViewDelegate
 
 y:
 
 @objc func buttonAction () {
 self.show(MainNavigationController(), sender: self)
 }
 
 por:
 
 @objc func buttonAction () {
 self.show(HomeViewController(), sender: self)
 }
 
 */
import UIKit

class StartAppViewController: UIViewController {
    
    let homeViewControllerRef: HomeViewController = HomeViewController()
    
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        view.addSubview(startButton)
        setupButtonConstraints()
        
    }
    
    private func setupButtonConstraints() {
        startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    @objc func buttonAction () {
        self.show(MainNavigationController(), sender: self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

