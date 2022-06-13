//
//  ViewController.swift
//  login and movies
//
//  Created by yaniv shtein on 03/06/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Address"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()

    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        return passwordField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        return button
    }()
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.backgroundColor = .systemMint
        
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        emailField.frame = CGRect(x: 20, y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        passwordField.frame = CGRect(x: 20, y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        loginButton.frame = CGRect(x: 20, y: passwordField.frame.origin.y+passwordField.frame.size.height+30, width: view.frame.size.width-40, height: 52)
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }

    @objc private func didTapButton(){
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, err in
            guard let strongSelf = self else{
                return
            }
            
            guard err == nil else {
                let alert = UIAlertController(title: "failed login", message: "try again", preferredStyle: .alert)
                strongSelf.present(alert, animated: true)
                return
            }
            print("you have signrd in")
            strongSelf.performSegue(withIdentifier: "to movies", sender: nil)
        }
    }
    
}

