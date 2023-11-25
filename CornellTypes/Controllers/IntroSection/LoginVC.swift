//
//  LoginVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/19/23.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Properties (view)
    
    //private let cornell = UILabel()
    //private let types = UILabel()
    //private let bear = UIImageView()
    private let logo = UIImageView()
    private let subtitle = UILabel()
    private let username = UITextField()
    private let password = UITextField()
    private let loginButton = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupLogo()
        setupSubtitle()
        setupUsername()
        setupPassword()
        setupLogin()
        setupBackButton()
    }
    
//    private func setupCornell() {
//        cornell.text = "Cornell"
//        cornell.font = UIFont(name: "Fredoka-Medium", size: 68.51)
//        cornell.textColor = UIColor.hack.tan
//        cornell.numberOfLines = 0
//
//        view.addSubview(cornell)
//        cornell.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            cornell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 49),
//            cornell.topAnchor.constraint(equalTo: view.topAnchor, constant: 122.79),
//            cornell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -101)
//        ])
//    }
//
//    private func setupBear() {
//        bear.image = UIImage(named: "logo")
//
//        view.addSubview(bear)
//        bear.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 204.12),
//            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
//        ])
//    }
//
//    private func setupTypes() {
//        types.text = "Types"
//        types.font = UIFont(name: "Fredoka-Medium", size: 66.12)
//
//        let attributedString = NSMutableAttributedString(string: types.text!)
//
//        for (index, _) in types.text!.enumerated() {
//            let range = NSRange(location: index, length: 1)
//            var color: UIColor
//            if index == 0 {
//                color = UIColor.hack.green
//            }
//            else if index == 1 {
//                color = UIColor.hack.purple
//            }
//            else if index == 2 {
//                color = UIColor.hack.blue
//            }
//            else if index == 3 {
//                color = UIColor.hack.yellow
//            }
//            else {
//                color = UIColor.hack.tan
//            }
//            attributedString.addAttribute(.foregroundColor, value: color, range: range)
//        }
//
//        types.attributedText = attributedString
//        types.sizeToFit()
//
//        view.addSubview(types)
//        types.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            types.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 118.93),
//            types.topAnchor.constraint(equalTo: view.topAnchor, constant: 188.9),
//            types.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -84.07)
//        ])
//    }

    private func setupLogo() {
        logo.image = UIImage(named: "cornellTypesLogo")
        
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 81),
            logo.widthAnchor.constraint(equalToConstant: 346),
            logo.heightAnchor.constraint(equalToConstant: 187.9)
        ])
    }
    
    private func setupSubtitle() {
        subtitle.text = "lorem ipsum dolor."
        subtitle.textColor = UIColor.hack.red
        subtitle.font = UIFont(name: "Fredoka-Regular", size: 22)
        subtitle.numberOfLines = 0
        
        view.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 276)
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
            username.topAnchor.constraint(equalTo: view.topAnchor, constant: 373),
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
            password.topAnchor.constraint(equalTo: view.topAnchor, constant: 447),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            password.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLogin() {
        loginButton.setTitle("log in", for: .normal)
        loginButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        loginButton.setTitleColor(UIColor.hack.white, for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        //loginButton.layer.borderColor = UIColor.hack.red.cgColor
        //loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 16
        loginButton.addTarget(self, action: #selector(pushHome), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 544),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 107),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -109),
            loginButton.widthAnchor.constraint(equalToConstant: 149),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backButton.widthAnchor.constraint(equalToConstant: 14),
        backButton.heightAnchor.constraint(equalToConstant: 24)])
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func pushHome() {
        let vc  = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}


