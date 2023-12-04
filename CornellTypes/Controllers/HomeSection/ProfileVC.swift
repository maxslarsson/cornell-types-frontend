//
//  ProfileVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/24/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    // MARK: - Properties (view)

    private let myProfile = UILabel()
    private let tape = UIImageView()
    private let square = UIImageView()
    private let bear = UIImageView()
    private let type = UIButton()
    private let school = UIButton()
    private let name = UITextField()
    private let bio = UITextField()
    private let logOut = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var personality: String = ""
    private var user: User!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupMyProfile()
        setupSquare()
        setupBear()
        setupTape()
        setupType()
        setupSchool()
        setupName()
        setupBio()
        setupLogOut()
        setupBackButton()
    }
    
    // MARK: - init
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    
    private func setupMyProfile() {
        myProfile.text = "my profile"
        myProfile.textColor = UIColor.hack.red
        myProfile.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(myProfile)
        myProfile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            myProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTape() {
        tape.image = UIImage(named: "tape")
        
        view.addSubview(tape)
        tape.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tape.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 82),
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
            square.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 95),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.widthAnchor.constraint(equalToConstant: 259),
            square.heightAnchor.constraint(equalToConstant: 228)
        ])
        
    }
    
    private func setupBear() {
        bear.image = UIImage(named: ("\(personality)bear").lowercased())
        
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            bear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bear.widthAnchor.constraint(equalToConstant: 208.87),
            bear.heightAnchor.constraint(equalToConstant: 223)
        ])
    }

    
    private func setupLogOut() {
        logOut.setTitle("log out", for: .normal)
        logOut.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        logOut.setTitleColor(UIColor.hack.white, for: .normal)
        logOut.setBackgroundImage(UIImage(named: "redrect"), for: .normal)
        logOut.layer.cornerRadius = 16
        logOut.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        view.addSubview(logOut)
        logOut.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logOut.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 745),
            logOut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            logOut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            logOut.heightAnchor.constraint(equalToConstant: 50)
        
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
            type.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 355),
            type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            type.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
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
            school.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 423),
            school.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            school.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            school.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupName() {
        name.layer.borderColor = UIColor.hack.red.cgColor
        name.layer.borderWidth = 2
        name.layer.cornerRadius = 11
        name.autocapitalizationType = .none
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: name.frame.height))
        
        name.leftView = paddingView
        name.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "name here", attributes: placeholderAttributes)
            
        name.attributedPlaceholder = attributedPlaceholder
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 513),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            name.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupBio() {
        bio.layer.borderColor = UIColor.hack.red.cgColor
        bio.layer.borderWidth = 2
        bio.layer.cornerRadius = 11
        bio.autocapitalizationType = .none
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: bio.frame.height))
        
        bio.leftView = paddingView
        bio.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "bio here", attributes: placeholderAttributes)
            
        bio.attributedPlaceholder = attributedPlaceholder
        view.addSubview(bio)
        bio.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 581),
            bio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            bio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            bio.heightAnchor.constraint(equalToConstant: 123)
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

    @objc private func pushVC() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushQuizResult() {
        let vc = QuizResultVC(user: user)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
}
