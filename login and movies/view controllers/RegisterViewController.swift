//
//  ViewController.swift
//  login and movies
//
//  Created by yaniv shtein on 03/06/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class RegisterViewController: UIViewController {
    
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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        return button
    }()
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        view.backgroundColor = .systemYellow
        
        registerButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        emailField.frame = CGRect(x: 20, y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        passwordField.frame = CGRect(x: 20, y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        registerButton.frame = CGRect(x: 20, y: passwordField.frame.origin.y+passwordField.frame.size.height+30, width: view.frame.size.width-40, height: 52)
        

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
        showCreateAccount(email: email, password: password)
       
           
    }
    
    func showCreateAccount(email: String, password:String){
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "continue", style: .default, handler: { _ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, err in
                guard let strongSelf = self else{
                    return
                }
                guard err == nil else{
                    print("account creation failed")
                    return
                }
                print("account creation successful")
                strongSelf.performSegue(withIdentifier: "back to login", sender: nil)
            }
                                                )
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { _ in
        }))
        present(alert, animated: true)
    }
    
    

}

