//
//  LoginScreen.swift
//  segundoProjetoViewCode
//
//  Created by Jefferson Alves on 08/10/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func TappedLoginButton()
    
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
            

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightText
        self.addElements()
        self.configConstraintsElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var subImageView: UIImageView = {
        let subImage:  UIImageView = UIImageView()
        subImage.translatesAutoresizingMaskIntoConstraints = false
        subImage.image = UIImage(named: "BG Login 1")
        return  subImage
    }()
    
    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"logo")
        return logo
    }()
    
    lazy var subLoginImagerView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named:"Image 2")
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 8
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "BF NFT"
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 35)
        return lb
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "O marktetgplace de NFTs da backfornt academy "
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 14)
        
        return lb
    }()

    
    lazy var userTextField: UITextField = {
        let tf: UITextField = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string: "Usuário:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.keyboardType = .emailAddress
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.textColor = .white
        return tf
    }()
    

    lazy var passwordTextField: UITextField = {
        let tf: UITextField = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSAttributedString(string:"Senha:", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.textColor = .white
        return tf
    }()
    
    lazy var LoginButton: UIButton = {
        let bt: UIButton = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        bt.isEnabled = true
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.addTarget(self, action: #selector(TappedLoginButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let bt: UIButton = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Recuperar Senha?", for: .normal)
        bt.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0) /*e730d6*/, for: .normal)
        bt.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var signInMetamaskVkiew: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    
    lazy var lineView: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        return line
    }()
    
    lazy var signInMetaMaskImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"Image 1")
       return image
    }()
    
    lazy var SignInMetaMaskLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Entra com a Metamask"
        lb.textColor = .white
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        return lb
    }()
    
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton){
        print("Bora recuperar essa senha!")
    }
    
    @objc func TappedLoginButton(_ sender: UIButton){
        print("Botão funfando")
        
        delegate?.TappedLoginButton()
        
    }
    

    
    func addElements(){
        addSubview(subImageView)
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(descriptionLabel)
        addSubview(recoverPasswordButton)
        addSubview(subLoginImagerView)
        addSubview(LoginButton)
        addSubview(lineView)
        addSubview(signInMetamaskVkiew)
        signInMetamaskVkiew.addSubview(signInMetaMaskImage)
        signInMetamaskVkiew.addSubview(SignInMetaMaskLabel)
    
    }
    
    func configConstraintsElements(){
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2),
            logoImage.heightAnchor.constraint(equalToConstant: 105),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            userTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 35),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 5),
            
            subLoginImagerView.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 65),
            subLoginImagerView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            subLoginImagerView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            subLoginImagerView.heightAnchor.constraint(equalToConstant: 50),
            
            LoginButton.topAnchor.constraint(equalTo: subLoginImagerView.topAnchor),
            LoginButton.leadingAnchor.constraint(equalTo: subLoginImagerView.leadingAnchor),
            LoginButton.trailingAnchor.constraint(equalTo: subLoginImagerView.trailingAnchor),
            LoginButton.bottomAnchor.constraint(equalTo: subLoginImagerView.bottomAnchor),
            
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: subLoginImagerView.bottomAnchor, constant: 50),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetamaskVkiew.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 48),
            signInMetamaskVkiew.leadingAnchor.constraint(equalTo: subLoginImagerView.leadingAnchor),
            signInMetamaskVkiew.trailingAnchor.constraint(equalTo: subLoginImagerView.trailingAnchor),
            signInMetamaskVkiew.heightAnchor.constraint(equalToConstant: 50),
            
            signInMetaMaskImage.leadingAnchor.constraint(equalTo: signInMetamaskVkiew.leadingAnchor, constant: 53),
            signInMetaMaskImage.centerYAnchor.constraint(equalTo: signInMetamaskVkiew.centerYAnchor),
            signInMetaMaskImage.heightAnchor.constraint(equalToConstant: 20),
            signInMetaMaskImage.widthAnchor.constraint(equalToConstant:  20),
            

            SignInMetaMaskLabel.leadingAnchor.constraint(equalTo: signInMetaMaskImage.trailingAnchor, constant: 35),
            SignInMetaMaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskVkiew.centerYAnchor),
   
            
            
            
            
          
         

            
            
           

            

        ])
    }
    
  
    // ao fazer assinatura de textField passar os campos
   public func configTextField(delegate: UITextFieldDelegate){
       userTextField.delegate = delegate
       passwordTextField.delegate = delegate
    }
    

}
