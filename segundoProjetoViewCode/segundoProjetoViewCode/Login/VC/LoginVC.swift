//
//  ViewController.swift
//  segundoProjetoViewCode
//
//  Created by Jefferson Alves on 08/07/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.configTextField(delegate: self)
        loginScreen?.delegate(delegate: self)
        
        
    }


}

extension LoginVC: LoginScreenProtocol {
    
    func TappedLoginButton() {
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true)
        print("Passou pela VC")
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        
        return true
    }
}
