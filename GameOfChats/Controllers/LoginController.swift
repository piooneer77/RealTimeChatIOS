//
//  LoginController.swift
//  GameOfChats
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    let databaseReferrence = Firebase.Database.database().reference(fromURL: FirebaseConstants.databaseURL)
    let authenticationReference = Firebase.Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded LoginController")
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        setViewConstraits()
    }
    
    lazy var loginSegmentedControl : UISegmentedControl = {
        let view = UISegmentedControl(items: [AppConstants.loginSegmentTitle, AppConstants.registerSegmentTitle])
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.selectedSegmentIndex = 1
        view.backgroundColor = .white
        view.tintColor = UIColor(r: 61, g: 91, b: 151)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(r: 220, g: 220, b: 220).cgColor
        view.layer.borderWidth = 2
        view.addTarget(self, action: #selector(toggleSegment), for: .valueChanged)
        return view
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginButton : UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        view.setTitle(AppConstants.LoginButtonTitle, for: .normal)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return view
    }()
    
    let nameTextField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = AppConstants.nameTextFieldPromptText
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.layer.borderColor = UIColor(r: 220, g: 220, b: 220).cgColor
        view.layer.borderWidth = 1
        view.isHidden = true
        return view
    }()
    
    let emailTextField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = AppConstants.emailTextFieldPromptText
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.layer.borderColor = UIColor(r: 220, g: 220, b: 220).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let magicTextField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = AppConstants.magicTextFieldPromptText
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.layer.borderColor = UIColor(r: 220, g: 220, b: 220).cgColor
        view.layer.borderWidth = 1
        view.isSecureTextEntry = true
        return view
    }()
    
    lazy var profileImageView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setProfileImage)))
        view.isUserInteractionEnabled = true
        view.image = UIImage(named: "white-snow-leopard")
        view.contentMode = .scaleAspectFit
        return view
    }()
}




