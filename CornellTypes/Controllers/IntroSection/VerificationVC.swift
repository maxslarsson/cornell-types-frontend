//
//  VerificationVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 12/1/23.
//

import UIKit


class VerificationVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let enterYourVerification = UILabel()
    private let code = UIImageView()
    private let below = UILabel()
    private let typeHere = UITextField()
    private let submit = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var username: String!
    
    // MARK: - init
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupEnterYourVerification()
        setupCode()
        setupBelow()
        setupTypeHere()
        setupSubmit()
        setupBackButton()
    }
    
    // MARK: - Views
    
    private func setupEnterYourVerification() {
        enterYourVerification.text = "enter your verification"
        enterYourVerification.textColor = UIColor.hack.red
        enterYourVerification.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        enterYourVerification.numberOfLines = 0
        
        view.addSubview(enterYourVerification)
        enterYourVerification.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterYourVerification.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterYourVerification.topAnchor.constraint(equalTo: view.topAnchor, constant: 164)
        ])
    }
    
    private func setupCode() {
        code.image = UIImage(named: "code")
        
        view.addSubview(code)
        code.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            code.topAnchor.constraint(equalTo: enterYourVerification.bottomAnchor, constant: 10),
            code.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 83.85),
            code.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -83.85),
            code.heightAnchor.constraint(equalToConstant: 79)
        ])
    }
    
    private func setupBelow() {
        below.text = "below"
        below.textColor = UIColor.hack.red
        below.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        below.numberOfLines = 0
        
        view.addSubview(below)
        below.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            below.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            below.topAnchor.constraint(equalTo: code.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupTypeHere() {
        typeHere.layer.borderColor = UIColor.hack.red.cgColor
        typeHere.layer.borderWidth = 2
        typeHere.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: typeHere.frame.height))
        
        typeHere.leftView = paddingView
        typeHere.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "type here", attributes: placeholderAttributes)
            
        typeHere.attributedPlaceholder = attributedPlaceholder
        view.addSubview(typeHere)
        typeHere.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            typeHere.topAnchor.constraint(equalTo: below.bottomAnchor, constant: 45.95),
            typeHere.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            typeHere.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            typeHere.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSubmit() {
        submit.setTitle("submit", for: .normal)
        submit.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        submit.setTitleColor(UIColor.hack.white, for: .normal)
        submit.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        submit.layer.cornerRadius = 16
        submit.addTarget(self, action: #selector(pushWelcome), for: .touchUpInside)
        
        view.addSubview(submit)
        submit.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            submit.topAnchor.constraint(equalTo: typeHere.bottomAnchor, constant: 22),
            submit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            submit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108),
            submit.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 14),
            backButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func pushWelcome() {
        guard let code = typeHere.text else { return }
        
        NetworkManager.shared.verifyUser(code: code) {
            NetworkManager.shared.getUserByUsername(username: self.username) { [weak self] user in
                guard let self = self else { return }
                let vc = WelcomeVC(user: user)
//                let vc = QuizResultVC(user: user)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
