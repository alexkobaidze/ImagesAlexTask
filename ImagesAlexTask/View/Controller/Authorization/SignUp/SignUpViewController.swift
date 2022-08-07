//
//  SignUpViewController.swift
//  ImagesAlexTask
//
//  Created by Alex on 07.08.22.
//

import UIKit

class SignUpViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    var viewModel: SignUpViewModel?
    
    let headerLabel = UILabel.attributedLabel()
    let validateMail = UILabel.attributedLabel()
    let validateAge = UILabel.attributedLabel()
    let textFieldPass = UITextField.attributedTextField()
    var textFieldAge = UITextField.attributedTextField()
    let textFieldEmail = UITextField.attributedTextField()
    let validatePass = UILabel.attributedLabel()
   
    var signUpButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldAge.delegate = self
        configureTextFields()
        configureLabel()
        SetUpStackViewImageProperties()
        configureButton()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .black
        
        
        
    }
    
    func configureTextFields() {
        
        textFieldEmail.placeholder = "მომხმარებლის მეილი"
        self.view.addSubview(textFieldEmail)
       
        textFieldPass.placeholder = "მომხმარებლის პაროლი"
        self.view.addSubview(textFieldPass)
        
        textFieldAge.placeholder = "მომხმარებლის ასაკი"
        self.view.addSubview(textFieldPass)
        
        textFieldPass.delegate = self
        textFieldEmail.delegate = self
        textFieldAge.delegate = self
        
        textFieldEmail.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingDidEnd)
                textFieldPass.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingDidEnd)
        textFieldAge.addTarget(self, action: #selector(ageTextFieldDidChange), for: .editingDidEnd)
        
    }
    
    func configureLabel(){
       
        validateMail.isHidden = true
        validatePass.isHidden = true
        validateAge.isHidden = true
        
        validateMail.text = "მეილი არასწორია"
        self.view.addSubview(validateMail)
     
        validatePass.text = "პაროლი არასწორია"
        self.view.addSubview(validatePass)
        
        validateAge.text = "ასაკი უნდა იყოს 18 და 99 წლამდე"
        self.view.addSubview(validatePass)
        
        headerLabel.text = "რეგისტრაცია"
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.view.addSubview(headerLabel)
    }
    
    func configureButton() {
        signUpButton.addTarget(self, action: #selector(tapOnSignUp),for: .touchUpInside)
        signUpButton.createRectangleButton( buttonTilte: "რეგისტრაცია")
        signUpButton.backgroundColor = .green
        
    }
    
        func SetUpStackViewImageProperties() -> Void {
            let stackViewProperties = UIStackView(arrangedSubviews: [headerLabel,textFieldEmail,validateMail,textFieldPass,validatePass,textFieldAge,validateAge,signUpButton])
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
    
    
    
    @objc func tapOnSignUp(sender: UIButton!) {
        
       
        if textFieldPass.text?.isEmpty == false && textFieldEmail.text?.isEmpty == false && textFieldAge.text?.isEmpty == false  && validateMail.text?.isEmpty == false && validatePass.text?.isEmpty == false && validateAge.text?.isEmpty == false{
                  userDefaults.set(textFieldEmail.text, forKey: "email")
                  userDefaults.set(textFieldPass.text, forKey: "password")
            let img = ImagesViewController()
            self.navigationController?.pushViewController(img, animated: true)
            img.modalPresentationStyle = .fullScreen

        }
                       

    }
    private func invalidEmail(_ value: String) -> String? {
            
            let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: value) {
               
                return "მეილის ფორმატი არასწორია"
            }
            
            return nil
        }
        
        private func invalidAge(_ value: String) -> String? {
            
            let set = CharacterSet(charactersIn: value)
            if !CharacterSet.decimalDigits.isSuperset(of: set) {
                return "ასაკი უნდა შეიცავდეს მხოლოდ ციფრებს"
            }
            
            if (Int(value) ?? 0) < 18 || (Int(value) ?? 0) > 99 {
                return "ასაკი უნდა იყოს 18 და 99 წლამდე"
            }
            return nil
        }
        
        private func invalidPassword(_ value: String) -> String? {
            
            if value.count < 6 {
                return "მინიმუმ 6 სიმბოლო"
            }
            
            if value.count > 12 {
                return "მაქსიმუმ 12 სიმბოლო"
            }
            return nil
        }
    
    
    func validateEMail(){
        if let email = textFieldEmail.text {
                    if let errorMessage = invalidEmail(email) {
                        validateMail.text = errorMessage
                        validateMail.isHidden = false
                    } else {
                        
                        validateMail.isHidden = true
                    }
                }
    }
    
    func validationeAge(){
        if let age = textFieldAge.text {
                    
                    if let errorMessage = invalidAge(age) {
                        validateAge.text = errorMessage
                        validateAge.isHidden = false
                    } else {
                        validateAge.isHidden = true
                    }
                }
        
    }
    
    func validationPassword() {
        if let password = textFieldPass.text {
                 if let errorMessage = invalidPassword(password) {
                     validatePass.text = errorMessage
                     validatePass.isHidden = false
                 } else {
                     validatePass.isHidden = true
                     
                 }
             }
    }
    @objc private func emailTextFieldDidChange() {
        validateEMail()
        if validateMail.text == "" {
            signUpButton.isEnabled = true

        }
       }

       @objc private func passwordTextFieldDidChange() {
           validationPassword()
           if validatePass.text == "" {
               signUpButton.isEnabled = true

           }
       }

    @objc private func ageTextFieldDidChange() {
        validationeAge()
        if validateAge.text == "" {
            signUpButton.isEnabled = true

        }
    }

}
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

           return true
       }
}

    


