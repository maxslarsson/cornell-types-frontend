//
//  UserProfileVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 12/3/23.
//

import UIKit

class UserProfileVC: UIViewController {
    
    // MARK: - Properties (view)

    private let otherProfile = UILabel()
    private let tape = UIImageView()
    private let square = UIImageView()
    private let bear = UIImageView()
    private let type = UIButton()
    private let school = UIButton()
    private let bioLabel = UILabel()
    private let bio = UILabel()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var personality: String = ""
    private var user: User!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupOtherProfile()
        setupSquare()
        setupBear()
        setupTape()
        setupType()
        setupSchool()
        setupBioLabel()
        setupBio()
    }
    
    // MARK: - init
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        
        NetworkManager.shared.getUserByUsername(username: user.username) { [weak self] user in
            guard let self = self else { return }
            self.otherProfile.text = "\(user.username) profile"
            self.bear.image = UIImage(named: "\(user.personality.lowercased())bear")
            self.type.setTitle(user.personality, for: .normal)
            self.bio.text = user.bio
            
            switch user.personality {
            case "INFJ", "INFP", "ENFJ", "ENFP":
                type.setBackgroundImage(UIImage(named: "greenrect"), for: .normal)
                type.setTitle(user.personality, for: .normal)
            case "INTJ", "INTP", "ENTJ", "ENTP":
                type.setBackgroundImage(UIImage(named: "purpleuserrect"), for: .normal)
            case "ISTP", "ISFP", "ESTP", "ESFP":
                type.setBackgroundImage(UIImage(named: "yellowrect"), for: .normal)
            case "ISTJ", "ISFJ", "ESTJ", "ESFJ":
                type.setBackgroundImage(UIImage(named: "bluerect"), for: .normal)
            default:
                print(user.personality)
            }
            
            switch user.school {
            case "cals":
                school.setBackgroundImage(UIImage(named: "greenrect"), for: .normal)
                school.setTitle("cals", for: .normal)
            case "aap":
                school.setBackgroundImage(UIImage(named: "bluerect"), for: .normal)
                school.setTitle("aap", for: .normal)
            case "a&s":
                school.setBackgroundImage(UIImage(named: "redrect"), for: .normal)
                school.setTitle("cas", for: .normal)
            case "engineering":
                school.setBackgroundImage(UIImage(named: "purplerect"), for: .normal)
                school.setTitle("engineering", for: .normal)
            case "ilr":
                school.setBackgroundImage(UIImage(named: "grayrect"), for: .normal)
                school.setTitle("ilr", for: .normal)
            case "hotel/dyson":
                school.setBackgroundImage(UIImage(named: "pinkrect"), for: .normal)
                school.setTitle("hotel/dyson", for: .normal)
            default:
                school.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
                school.setTitle("hum ec", for: .normal)
            }
        }
    }

    
    // MARK: - Views
    
    private func setupOtherProfile() {
        otherProfile.textColor = UIColor.hack.red
        otherProfile.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(otherProfile)
        otherProfile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            otherProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            otherProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTape() {
        tape.image = UIImage(named: "tape")
        
        view.addSubview(tape)
        tape.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tape.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 32),
            tape.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tape.widthAnchor.constraint(equalToConstant: 134),
            tape.heightAnchor.constraint(equalToConstant: 26)
        ])
        
    }
    
    private func setupSquare() {
        square.image = UIImage(named: "square")
        
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            square.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 45),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.widthAnchor.constraint(equalToConstant: 259),
            square.heightAnchor.constraint(equalToConstant: 228)
        ])
        
    }
    
    private func setupBear() {
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 50),
            bear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bear.widthAnchor.constraint(equalToConstant: 208.87),
            bear.heightAnchor.constraint(equalToConstant: 223)
        ])
    }
    
    private func setupType() {
        type.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        type.setTitleColor(UIColor.hack.white, for: .normal)
        type.layer.cornerRadius = 16
        
        type.addTarget(self, action: #selector(pushQuizResult), for: .touchUpInside)
        view.addSubview(type)
        type.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            type.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 305),
            type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            type.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            type.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSchool() {
        school.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        school.setTitleColor(UIColor.hack.white, for: .normal)
        school.layer.cornerRadius = 16
        
        view.addSubview(school)
        school.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            school.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 373),
            school.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            school.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            school.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupBioLabel() {
        bioLabel.text = "Bio"
        bioLabel.textColor = UIColor.hack.red
        bioLabel.font = UIFont(name: "Fredoka-Medium", size: 22)
        bioLabel.numberOfLines = 0
        
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 383),
            bioLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupBio() {
        bio.textColor = UIColor.hack.red
        bio.font = UIFont(name: "Fredoka-Regular", size: 22)
        bio.numberOfLines = 0
        
        view.addSubview(bio)
        bio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bio.topAnchor.constraint(equalTo: otherProfile.bottomAnchor, constant: 390),
            bio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 61),
            bio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -71)
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
    
    @objc private func pushQuizResult() {
        let vc = QuizResultVC(user: user)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
}
