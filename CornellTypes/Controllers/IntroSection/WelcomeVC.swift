//
//  WelcomeVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/23/23.
//

import UIKit

class WelcomeVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let welcomeUser = UIImageView()
    private let subtitle = UILabel()
    private let quizButton = UIButton()
    private let or = UILabel()
    private let enterMBTIButton = UIButton()
    private let whatsMBTIButton = UIButton()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        self.navigationItem.hidesBackButton = true
        
        setupWelcomeUser()
        setupSubtitle()
        setupQuizButton()
        setupOr()
        setupEnterMBTIButton()
        setupWhatsMBTIButton()
    }
    
    // MARK: - Set Up Views

    private func setupWelcomeUser() {
        welcomeUser.image = UIImage(named: "welcomeuser")
        
        view.addSubview(welcomeUser)
        welcomeUser.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            welcomeUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            welcomeUser.widthAnchor.constraint(equalToConstant: 303),
            welcomeUser.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupSubtitle() {
        subtitle.text = "    nice to meet you\nlet's find your typing!"
        subtitle.textColor = UIColor.hack.red
        subtitle.font = UIFont(name: "Fredoka-Regular", size: 22)
        subtitle.numberOfLines = 0
        
        view.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 292)
        ])
    }
    
    private func setupQuizButton() {
        quizButton.setTitle("take the quiz", for: .normal)
        quizButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        quizButton.setTitleColor(UIColor.hack.white, for: .normal)
        quizButton.setBackgroundImage(UIImage(named: "purplerect"), for: .normal)
        quizButton.layer.cornerRadius = 16
        quizButton.addTarget(self, action: #selector(pushQuiz), for: .touchUpInside)
        
        view.addSubview(quizButton)
        quizButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 418),
            quizButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizButton.widthAnchor.constraint(equalToConstant: 243),
            quizButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupOr() {
        or.text = "OR"
        or.textColor = UIColor.hack.red
        or.font = UIFont(name: "Fredoka-Regular", size: 22)
        
        view.addSubview(or)
        or.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            or.topAnchor.constraint(equalTo: view.topAnchor, constant: 503),
            or.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupEnterMBTIButton() {
        enterMBTIButton.setTitle("enter mbti", for: .normal)
        enterMBTIButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        enterMBTIButton.setTitleColor(UIColor.hack.white, for: .normal)
        enterMBTIButton.setBackgroundImage(UIImage(named: "bluerect"), for: .normal)
        enterMBTIButton.layer.cornerRadius = 16
        enterMBTIButton.addTarget(self, action: #selector(pushEnterMBTI), for: .touchUpInside)
        
        view.addSubview(enterMBTIButton)
        enterMBTIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterMBTIButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 565),
            enterMBTIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterMBTIButton.widthAnchor.constraint(equalToConstant: 243),
            enterMBTIButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupWhatsMBTIButton() {
        whatsMBTIButton.setTitle("what's an mbti?", for: .normal)
        whatsMBTIButton.titleLabel!.font = UIFont(name: "Fredoka-Regular", size: 22)
        whatsMBTIButton.setTitleColor(UIColor.hack.darkpink, for: .normal)
        whatsMBTIButton.backgroundColor = UIColor.hack.white
        whatsMBTIButton.layer.cornerRadius = 16
        whatsMBTIButton.addTarget(self, action: #selector(pushWhatsMBTI), for: .touchUpInside)
        
        view.addSubview(whatsMBTIButton)
        whatsMBTIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatsMBTIButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 712),
            whatsMBTIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whatsMBTIButton.widthAnchor.constraint(equalToConstant: 153),
            whatsMBTIButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func pushQuiz() {
        let vc  = QuizVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushEnterMBTI() {
        let vc  = EnterMBTIVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushWhatsMBTI() {
        let vc  = WhatsMBTIVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
