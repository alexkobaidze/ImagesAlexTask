//
//  SignUpViewModel.swift
//  ImagesAlexTask
//
//  Created by Alex on 07.08.22.
//

import Foundation
import UIKit

struct SignUpViewModel  {
  
    let userDefaults = UserDefaults.standard
   
    func onTapRegister(passwordTextField: UITextField, emailTextField:UITextField, ageTextField: UITextField) {
            
            if passwordTextField.text?.isEmpty == false && emailTextField.text?.isEmpty == false && ageTextField.text?.isEmpty == false {
                userDefaults.set(emailTextField.text, forKey: "email")
                userDefaults.set(passwordTextField.text, forKey: "password")
   
            }
        }
    
}



