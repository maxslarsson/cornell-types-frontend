//
//  SignupVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/19/23.
//

import UIKit

class SignupVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let logo = UIImageView()
    private let subtitle = UILabel()
    private let name = UITextField()
    private let username = UITextField()
    private let password = UITextField()
    private let signupButton = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupLogo()
        setupSubtitle()
        setupName()
        setupUsername()
        setupPassword()
        setupSignup()
        setupBackButton()
    }
    
    // MARK: - Set Up Views
    
    private func setupLogo() {
        logo.image = UIImage(named: "cornellTypesLogo")
        
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            logo.widthAnchor.constraint(equalToConstant: 346),
            logo.heightAnchor.constraint(equalToConstant: 187.9)
        ])
    }
    
    private func setupSubtitle() {
        subtitle.text = "meet all types of students!"
        subtitle.textColor = UIColor.hack.red
        subtitle.font = UIFont(name: "Fredoka-Regular", size: 22)
        subtitle.numberOfLines = 0
        
        view.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 286)
        ])
    }
    
    private func setupName() {
        name.layer.borderColor = UIColor.hack.red.cgColor
        name.layer.borderWidth = 2
        name.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: name.frame.height))
        
        name.leftView = paddingView
        name.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "name", attributes: placeholderAttributes)
            
        name.attributedPlaceholder = attributedPlaceholder
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            name.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupUsername() {
        username.layer.borderColor = UIColor.hack.red.cgColor
        username.layer.borderWidth = 2
        username.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: username.frame.height))
        
        username.leftView = paddingView
        username.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "username", attributes: placeholderAttributes)
            
        username.attributedPlaceholder = attributedPlaceholder
        view.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: view.topAnchor, constant: 434),
            username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            username.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupPassword() {
        password.layer.borderColor = UIColor.hack.red.cgColor
        password.layer.borderWidth = 2
        password.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: password.frame.height))
        
        password.leftView = paddingView
        password.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "password", attributes: placeholderAttributes)
            
        password.attributedPlaceholder = attributedPlaceholder
        view.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: view.topAnchor, constant: 508),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            password.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSignup() {
        signupButton.setTitle("sign up", for: .normal)
        signupButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        signupButton.setTitleColor(UIColor.hack.white, for: .normal)
        signupButton.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        signupButton.layer.cornerRadius = 16
        signupButton.addTarget(self, action: #selector(pushWelcome), for: .touchUpInside)
        
        view.addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 605),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 107),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -109),
            signupButton.widthAnchor.constraint(equalToConstant: 149),
            signupButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backButton.widthAnchor.constraint(equalToConstant: 14),
        backButton.heightAnchor.constraint(equalToConstant: 24)])
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func pushWelcome() {
        let vc  = WelcomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
