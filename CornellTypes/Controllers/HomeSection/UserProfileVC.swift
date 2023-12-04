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
    
    // MARK: - Views
    
    private func setupOtherProfile() {
        otherProfile.text = "\(user.username)'s profile"
        otherProfile.textColor = UIColor.hack.red
        otherProfile.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(otherProfile)
        otherProfile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            otherProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            otherProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTape() {
        tape.image = UIImage(named: "tape")
        
        view.addSubview(tape)
        tape.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tape.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
            tape.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            tape.widthAnchor.constraint(equalToConstant: 134),
            tape.heightAnchor.constraint(equalToConstant: 26)
        ])
        
    }
    
    private func setupSquare() {
        square.image = UIImage(named: "square")
        
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            square.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            square.widthAnchor.constraint(equalToConstant: 259),
            square.heightAnchor.constraint(equalToConstant: 228)
        ])
        
    }
    
    private func setupBear() {
        bear.image = UIImage(named: ("\(personality)bear").lowercased())
        
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 73),
            bear.widthAnchor.constraint(equalToConstant: 208.87),
            bear.heightAnchor.constraint(equalToConstant: 223)
        ])
    }
    
    private func setupType() {
        type.setTitle(personality, for: .normal)
        type.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        type.setTitleColor(UIColor.hack.white, for: .normal)
        type.layer.cornerRadius = 16
        
        switch personality {
        case "INFJ", "INFP", "ENFJ", "ENFP":
            type.setBackgroundImage(UIImage(named: "greenrect"), for: .normal)
        case "INTJ", "INTP", "ENTJ", "ENTP":
            type.setBackgroundImage(UIImage(named: "purplerect"), for: .normal)
        case "ISTP", "ISFP", "ESTP", "ESFP":
            type.setBackgroundImage(UIImage(named: "yellowrect"), for: .normal)
        case "ISTJ", "ISFJ", "ESTJ", "ESFJ":
            type.setBackgroundImage(UIImage(named: "bluerect"), for: .normal)
        default:
            print(personality)
        }
        type.addTarget(self, action: #selector(pushQuizResult), for: .touchUpInside)
        view.addSubview(type)
        type.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            type.topAnchor.constraint(equalTo: view.topAnchor, constant: 355),
            type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            type.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            type.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSchool() {
        school.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        school.setTitleColor(UIColor.hack.white, for: .normal)
        school.layer.cornerRadius = 16
        
        switch user.school {
        case "College of Agriculture and Life Sciences":
            school.setBackgroundImage(UIImage(named: "greenrect"), for: .normal)
            school.setTitle("cals", for: .normal)
        case "College of Architecture, Art, and Planning":
            school.setBackgroundImage(UIImage(named: "bluerect"), for: .normal)
            school.setTitle("aap", for: .normal)
        case "College of Arts and Sciences":
            school.setBackgroundImage(UIImage(named: "redrect"), for: .normal)
            school.setTitle("cas", for: .normal)
        case "College of Engineering":
            school.setBackgroundImage(UIImage(named: "purplerect"), for: .normal)
            school.setTitle("engineering", for: .normal)
        case "School of Industrial and Labor Relations":
            school.setBackgroundImage(UIImage(named: "grayrect"), for: .normal)
            school.setTitle("ilr", for: .normal)
        case "Cornell SC Johnson College of Business", "School of Hotel Administration":
            school.setBackgroundImage(UIImage(named: "pinkrect"), for: .normal)
            school.setTitle("hotel/dyson", for: .normal)
        default:
            school.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
            school.setTitle("hum ec", for: .normal)
        }
        
        view.addSubview(school)
        school.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            school.topAnchor.constraint(equalTo: view.topAnchor, constant: 423),
            school.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            school.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            school.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupBioLabel() {
        bioLabel.text = "Bio:"
        bioLabel.textColor = UIColor.hack.red
        bioLabel.font = UIFont(name: "Fredoka-Medium", size: 22)
        bioLabel.numberOfLines = 0
        
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 536),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72)
        ])
    }
    
    private func setupBio() {
        //bio.text = user.bio
        bio.textColor = UIColor.hack.red
        bio.font = UIFont(name: "Fredoka-Medium", size: 22)
        bio.numberOfLines = 0
        
        view.addSubview(bio)
        bio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bio.topAnchor.constraint(equalTo: view.topAnchor, constant: 618),
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
