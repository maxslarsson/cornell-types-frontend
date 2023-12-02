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
    private let email = UITextField()
    private let username = UITextField()
    private let password = UITextField()
    private let signupButton = UIButton()
    private let backButton = UIButton()
    private let college = UITextField()
    //private let collegeName = UILabel()
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupLogo()
        setupSubtitle()
        setupEmail()
        setupUsername()
        setupPassword()
        setupSignup()
        setupCollege()
        //setupCollegeName()
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
    
    private func setupEmail() {
        email.layer.borderColor = UIColor.hack.red.cgColor
        email.layer.borderWidth = 2
        email.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: email.frame.height))
        
        email.leftView = paddingView
        email.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "cornell email", attributes: placeholderAttributes)
            
        email.attributedPlaceholder = attributedPlaceholder
        view.addSubview(email)
        email.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            email.heightAnchor.constraint(equalToConstant: 50)
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
        signupButton.addTarget(self, action: #selector(pushVerification), for: .touchUpInside)
        
        view.addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 662),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 107),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -109),
            signupButton.widthAnchor.constraint(equalToConstant: 149),
            signupButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupCollege() {
        college.layer.borderColor = UIColor.hack.red.cgColor
        college.layer.borderWidth = 2
        college.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: college.frame.height))
        
        college.leftView = paddingView
        college.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "college", attributes: placeholderAttributes)
            
        college.attributedPlaceholder = attributedPlaceholder
        view.addSubview(college)
        college.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            college.topAnchor.constraint(equalTo: view.topAnchor, constant: 585),
            college.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            college.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            college.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
//    private func setupCollegeName() {
//        collegeName.text = "* Exact format: Cornell SC Johnson College of Business, College of Arts and Sciences, School of Hotel Administration"
//        collegeName.textColor = UIColor.hack.darkpink
//        collegeName.font = UIFont(name: "Fredoka-Regular", size: 14)
//        collegeName.numberOfLines = 0
//
//        view.addSubview(collegeName)
//        collegeName.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            collegeName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            collegeName.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20),
//            collegeName.widthAnchor.constraint(equalToConstant: 250)
//        ])
//    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backButton.widthAnchor.constraint(equalToConstant: 14),
        backButton.heightAnchor.constraint(equalToConstant: 24)])
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func pushVerification() {
        print("pushing verification")
        let user = User(
            email: lowercasedFirstLetter(email.text ?? ""),
            username: lowercasedFirstLetter(username.text ?? ""),
            password: password.text ?? "",
            school: college.text ?? ""
        )
        
        NetworkManager.shared.registerUser(user: user) { registeredUser in
            print("User registered successfully: \(registeredUser)")
            
            let vc = VerificationVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


    private func lowercasedFirstLetter(_ text: String) -> String {
        guard let firstCharacter = text.first else {
            return text
        }
        
        return String(firstCharacter).lowercased() + String(text.dropFirst())
    }


    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
