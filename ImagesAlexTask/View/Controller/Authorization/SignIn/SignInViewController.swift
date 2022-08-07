//
//  SignInViewController.swift
//  ImagesAlexTask
//
//  Created by Alex on 07.08.22.
//

import UIKit

struct User {
    var age: Int
}

class SignInViewController: UIViewController {

    let headerLabel = UILabel.attributedLabel()
    let validateMail = UILabel.attributedLabel()
    let textFieldPass = UITextField.attributedTextField()
    let textFieldEmail = UITextField.attributedTextField()
    let validatePass = UILabel.attributedLabel()
    var signInButton = UIButton()
    var signUpButton = UIButton()
    
    let userDefaults = UserDefaults.standard
    
    lazy var registeredEmail = userDefaults.string(forKey: "email") ?? ""
    lazy var registeredPassword = userDefaults.string(forKey: "password") ?? ""
    
    lazy var users: [String : String] = [
            "test@gmail.com" : "test123456",
            registeredEmail : registeredPassword
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureLabel()
        SetUpStackViewImageProperties()
        configureButton()
        view.backgroundColor = .black

    }
    
    func configureTextFields() {
        textFieldPass.delegate = self
        textFieldEmail.delegate = self
        
        textFieldEmail.placeholder = "მომხმარებლის მეილი"
        self.view.addSubview(textFieldEmail)
       
        textFieldPass.placeholder = "მომხმარებლის პაროლი"
        self.view.addSubview(textFieldPass)
    }
    
    func configureLabel(){
       
        validateMail.isHidden = true
        validatePass.isHidden = true
        
        validateMail.text = "მეილი არასწორია"
        self.view.addSubview(validateMail)
     
        validatePass.text = "პაროლი არასწორია"
        self.view.addSubview(validatePass)
        
        headerLabel.text = "ავტორიზაცია"
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.view.addSubview(headerLabel)
    }
    func configureButton() {
        signInButton.createRectangleButton( buttonTilte: "ავტორიზაცია")
        signUpButton.createRectangleButton( buttonTilte: "რეგისტრაცია")
        signUpButton.backgroundColor = .green
        signUpButton.addTarget(self, action: #selector(navigateToSignUp),for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(NavigateToHome),for: .touchUpInside)
        
    }
    
        func SetUpStackViewImageProperties() -> Void {
            let stackViewProperties = UIStackView(arrangedSubviews: [headerLabel,textFieldEmail,validateMail,textFieldPass,validatePass,signInButton,signUpButton])
            stackViewProperties.distribution = .fill
            stackViewProperties.spacing = 30
            stackViewProperties.axis = .vertical
            
            stackViewProperties.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackViewProperties)
            stackViewProperties.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            stackViewProperties.widthAnchor.constraint(equalToConstant: 200).isActive = true
            
            stackViewProperties.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            stackViewProperties.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
            stackViewProperties.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    
    
    @objc func NavigateToHome(sender: UIButton!) {
        checkValidForm(textFieldEmail, isEmail: true)
        checkValidForm(textFieldPass, isEmail: false)
        for (emails, passwords) in users {
            if textFieldEmail.text == emails && textFieldPass.text == passwords {
                let img = ImagesViewController()
                    self.navigationController?.pushViewController(img, animated: true)
                img.modalPresentationStyle = .fullScreen
            } else {
                checkValidForm(textFieldEmail, isEmail: true)
            }
        }
    }
    
    @objc func navigateToSignUp(sender: UIButton!) {
     
           let signUp = SignUpViewController()
               self.navigationController?.pushViewController(signUp, animated: true)
               signUp.modalPresentationStyle = .fullScreen
    }
    private func checkValidForm(_ textField: UITextField, isEmail: Bool) {
      
           for (emails, passwords) in users {
               
               if isEmail {
                   (textFieldEmail.text == emails) ? (validateMail
                    .isHidden = true) : (validateMail.isHidden = false)
               } else {
                   (textFieldPass.text == passwords) ? (validatePass.isHidden = true) : (validatePass.isHidden = false)
               }
               
           }
       }

}
extension SignInViewController: UITextFieldDelegate {
    
}



