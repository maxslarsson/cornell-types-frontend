//
//  EnterMBTIVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/23/23.
//

import UIKit

class EnterMBTIVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let enter = UILabel()
    private let mbti = UIImageView()
    private let below = UILabel()
    private let mbtiText = UITextField()
    private let submit = UIButton()
    private let backButton = UIButton()
    private let bear = UIImageView()
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - init
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupEnter()
        setupMBTI()
        setupBelow()
        setupType()
        setupSubmit()
        setupBackButton()
        setupBear()
    }
    
    // MARK: - Set Up Views
    
    private func setupEnter() {
        enter.text = "enter your"
        enter.textColor = UIColor.hack.red
        enter.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        enter.numberOfLines = 0
        
        view.addSubview(enter)
        enter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enter.topAnchor.constraint(equalTo: view.topAnchor, constant: 94)
        ])
    }
    
    private func setupMBTI() {
        mbti.image = UIImage(named: "mbti")
        
        view.addSubview(mbti)
        mbti.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mbti.topAnchor.constraint(equalTo: view.topAnchor, constant: 142.48),
            mbti.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 99.85),
            mbti.widthAnchor.constraint(equalToConstant: 197),
            mbti.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    private func setupBelow() {
        below.text = "below"
        below.textColor = UIColor.hack.red
        below.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        enter.numberOfLines = 0
        
        view.addSubview(below)
        below.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            below.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            below.topAnchor.constraint(equalTo: view.topAnchor, constant: 226.05)
        ])
    }
    
    private func setupType() {
        mbtiText.layer.borderColor = UIColor.hack.red.cgColor
        mbtiText.layer.borderWidth = 2
        mbtiText.layer.cornerRadius = 11
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: mbtiText.frame.height))
        
        mbtiText.leftView = paddingView
        mbtiText.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "type here", attributes: placeholderAttributes)
            
        mbtiText.attributedPlaceholder = attributedPlaceholder
        view.addSubview(mbtiText)
        mbtiText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mbtiText.topAnchor.constraint(equalTo: view.topAnchor, constant: 306),
            mbtiText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            mbtiText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            mbtiText.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSubmit() {
        submit.setTitle("submit", for: .normal)
        submit.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        submit.setTitleColor(UIColor.hack.white, for: .normal)
        submit.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        submit.layer.cornerRadius = 16
        submit.addTarget(self, action: #selector(pushResult), for: .touchUpInside)
        
        view.addSubview(submit)
        submit.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            submit.topAnchor.constraint(equalTo: view.topAnchor, constant: 378),
            submit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            submit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108),
            submit.widthAnchor.constraint(equalToConstant: 159),
            submit.heightAnchor.constraint(equalToConstant: 60)
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
    
    private func setupBear() {
        bear.image = UIImage(named: "bearthinking")
        
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 416),
            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            bear.widthAnchor.constraint(equalToConstant: 313),
            bear.heightAnchor.constraint(equalToConstant: 445)
        ])
    }
    
    
    @objc private func pushResult() {
        guard let type = mbtiText.text else { return }
        
        NetworkManager.shared.enterMBTI(user: user, type: type) { [weak self] personalityType in
            guard let self = self else { return }
            
            let vc = QuizResultVC(user: self.user)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
