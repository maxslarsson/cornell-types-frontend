//
//  WhatsMBTIVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/23/23.
//

import UIKit

class WhatsMBTIVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let whatsMBTI = UIImageView()
    private let desc = UILabel()
    private let quizButton = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupWhatsMBTI()
        setupDescription()
        setupQuizButton()
        setupBackButton()
    }

    // MARK: - Set Up Views
    
    private func setupWhatsMBTI() {
        whatsMBTI.image = UIImage(named: "whatsmbti")
        
        view.addSubview(whatsMBTI)
        whatsMBTI.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatsMBTI.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            whatsMBTI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 83),
            whatsMBTI.widthAnchor.constraint(equalToConstant: 212),
            whatsMBTI.heightAnchor.constraint(equalToConstant: 133)
        ])
        
    }
    
    private func setupDescription() {
        desc.text = "MBTI stands for the Myers-Briggs Type Indicator, a personality assessment tool.\n\nIt categorizes individuals into 16 types based on preferences in four dichotomies: Extraversion vs. Introversion, Sensing vs. Intuition, Thinking vs. Feeling, and Judging vs. Perceiving, resulting in a four-letter type (e.g., INFP, ESTJ).\n\n   Take the quiz to find your\n                    typing!"
        desc.textColor = UIColor.hack.red
        desc.font = UIFont(name: "Fredoka-Regular", size: 21)
        desc.numberOfLines = 0
        
        view.addSubview(desc)
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desc.topAnchor.constraint(equalTo: view.topAnchor, constant: 254),
            desc.widthAnchor.constraint(equalToConstant: 279)
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
            quizButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 690),
            quizButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizButton.widthAnchor.constraint(equalToConstant: 243),
            quizButton.heightAnchor.constraint(equalToConstant: 50)
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
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushQuiz() {
        let vc  = QuizVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
