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
    
//    private func setupWhats() {
//        whats.text = "What's"
//        whats.font = UIFont(name: "Fredoka-Medium", size: 68.51)
//        whats.textColor = UIColor.hack.tan
//        //welcome.setOutline(color: UIColor.hack.red, thickness: 0.7)
//        whats.numberOfLines = 0
//
//        view.addSubview(whats)
//        whats.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            whats.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
//            whats.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }
//
//    private func setupMBTI() {
//        mbti.text = "MBTI?"
//        mbti.font = UIFont(name: "Fredoka-Medium", size: 66.12)
//
//        let attributedString = NSMutableAttributedString(string: mbti.text!)
//
//        for (index, _) in mbti.text!.enumerated() {
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
//        mbti.attributedText = attributedString
//        mbti.sizeToFit()
//
//        view.addSubview(mbti)
//        mbti.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            mbti.topAnchor.constraint(equalTo: view.topAnchor, constant: 132),
//            mbti.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }

    private func setupWhatsMBTI() {
        whatsMBTI.image = UIImage(named: "whatsmbti")
        
        view.addSubview(whatsMBTI)
        whatsMBTI.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatsMBTI.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
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
            desc.topAnchor.constraint(equalTo: view.topAnchor, constant: 244),
            desc.widthAnchor.constraint(equalToConstant: 279)
        ])
    }
    
    private func setupQuizButton() {
        quizButton.setTitle("take the quiz", for: .normal)
        quizButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        quizButton.setTitleColor(UIColor.hack.white, for: .normal)
        quizButton.setBackgroundImage(UIImage(named: "purplerect"), for: .normal)
        //login.layer.borderColor = UIColor.hack.red.cgColor
        //login.layer.borderWidth = 2
        quizButton.layer.cornerRadius = 16
        quizButton.addTarget(self, action: #selector(pushQuiz), for: .touchUpInside)
        
        view.addSubview(quizButton)
        quizButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 680),
            quizButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizButton.widthAnchor.constraint(equalToConstant: 243),
            quizButton.heightAnchor.constraint(equalToConstant: 50)
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
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushQuiz() {
        let vc  = QuizVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
