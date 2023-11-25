//
//  ViewController.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/19/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties (view)
    
    private let cornell = UILabel()
    private let types = UILabel()
    private let logo = UIImageView()
    private let bear = UIImageView()
    private let subtitle = UILabel()
    private let login = UIButton()
    private let signup = UIButton()
    private let image = UIImageView()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        //setupBear()
        //setupCornell()
        //setupTypes()
        setupLogo()
        setupSubtitle()
        setupLogin()
        setupSignup()
    }

    // MARK: - Set Up Views
    
//    private func setupCornell() {
//        cornell.text = "Cornell"
//        cornell.font = UIFont(name: "Fredoka-Medium", size: 68.51)
//        cornell.textColor = UIColor.hack.tan
//        cornell.numberOfLines = 0
//        //cornell.setOutline(color: UIColor.hack.red, thickness: 1)
//
//        view.addSubview(cornell)
//        cornell.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            cornell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
//            cornell.topAnchor.constraint(equalTo: view.topAnchor, constant: 192.79),
//            cornell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -102)
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
//            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 203.12),
//            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 161),
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
//            types.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 117.93),
//            types.topAnchor.constraint(equalTo: view.topAnchor, constant: 258.19),
//            types.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85.07)
//        ])
//    }
//
    private func setupLogo() {
        logo.image = UIImage(named: "cornellTypesLogo")
        
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 151),
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
            subtitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 346)
        ])
    }
    
    private func setupLogin() {
        login.setTitle("log in", for: .normal)
        login.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        login.setTitleColor(UIColor.hack.white, for: .normal)
        login.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        //login.layer.borderColor = UIColor.hack.red.cgColor
        //login.layer.borderWidth = 2
        login.layer.cornerRadius = 16
        login.addTarget(self, action: #selector(pushLogin), for: .touchUpInside)
        
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            login.topAnchor.constraint(equalTo: view.topAnchor, constant: 426),
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            login.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            login.widthAnchor.constraint(equalToConstant: 243),
            login.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSignup() {
        signup.setTitle("sign up", for: .normal)
        signup.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        signup.setTitleColor(UIColor.hack.white, for: .normal)
        signup.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        //signup.layer.borderColor = UIColor.hack.red.cgColor
        //signup.layer.borderWidth = 2
        signup.layer.cornerRadius = 16
        signup.addTarget(self, action: #selector(pushSignup), for: .touchUpInside)
        
        view.addSubview(signup)
        signup.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signup.topAnchor.constraint(equalTo: view.topAnchor, constant: 503),
            signup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            signup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            signup.widthAnchor.constraint(equalToConstant: 243),
            signup.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func pushLogin() {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushSignup() {
        let vc = SignupVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UILabel {
    func setOutline(color: UIColor, thickness: CGFloat) {
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: color,
            NSAttributedString.Key.strokeWidth: -thickness,
            NSAttributedString.Key.foregroundColor: textColor!,
            NSAttributedString.Key.font: font!
        ]

        attributedText = NSAttributedString(string: text ?? "", attributes: strokeTextAttributes)
    }
}
