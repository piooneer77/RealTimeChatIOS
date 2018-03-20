//
//  LoginControllerViewsExtension.swift
//  GameOfChats
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

extension LoginController {
    
    func setViewConstraits(){
        addSubViewsInsideMainViews()
        setContainerViewConstraints(uiView: containerView)
        setLoginButonConstraints (button : loginButton)
        setNameTextFieldConstraints(textField: nameTextField)
        setEmailTextFieldConstraints(textField: emailTextField)
        setMagicTextFieldConstraints(textField: magicTextField)
        setProfileImageView(image: profileImageView)
        setLoginSegmentControlConstraints(segment: loginSegmentedControl)
    }
    
    func addSubViewsInsideMainViews(){
        view.addSubview(containerView)
        view.addSubview(loginButton)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(magicTextField)
        view.addSubview(profileImageView)
        view.addSubview(loginSegmentedControl)
    }
    
    private func setLoginSegmentControlConstraints (segment: UISegmentedControl){
        NSLayoutConstraint.activate([
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segment.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -12),
            segment.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            segment.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setProfileImageView(image: UIImageView){
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            image.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func setNameTextFieldConstraints(textField : UITextField){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            textField.topAnchor.constraint(equalTo: containerView.topAnchor),
            textField.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func setEmailTextFieldConstraints(textField : UITextField){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            textField.bottomAnchor.constraint(equalTo: magicTextField.topAnchor),
            textField.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func setMagicTextFieldConstraints(textField : UITextField){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            textField.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func setLoginButonConstraints(button: UIButton){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12),
            button.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setContainerViewConstraints(uiView: UIView){
        NSLayoutConstraint.activate([
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            uiView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
