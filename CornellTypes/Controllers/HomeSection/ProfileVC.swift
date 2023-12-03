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
    
    private func setupMyProfile() {
        myProfile.text = "my profile"
        myProfile.textColor = UIColor.hack.red
        myProfile.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(myProfile)
        myProfile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            myProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
            logOut.topAnchor.constraint(equalTo: view.topAnchor, constant: 745),
            logOut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            logOut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            logOut.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    @objc private func pushVC() {
        NetworkManager.shared.logoutUser(user: user) { [weak self] loggedOutUser in
            guard let self = self else { return }
            print("Successfully logged out \(loggedOutUser.username)")
            
            DispatchQueue.main.async {
                let vc = ViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
