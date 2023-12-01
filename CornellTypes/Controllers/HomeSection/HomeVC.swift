//
//  HomeVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/23/23.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let logo = UIImageView()
    private let exploreMBTITypes = UILabel()
    private let pfp = UIButton()
    private let forwardButton = UIButton()
    private let mbtiStats = UIButton()
    private let nameLabel = UILabel()
    private let postButton = UIButton()
    private var filterCollectionView: UICollectionView!
    private var postCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Properties (data)
    
    private var filters: [String] = []
    private let posts: [Post] = []
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        self.navigationItem.hidesBackButton = true
        
        setupLogo()
        setupPFP()
        setupExploreMBTITypes()
        setupMBTIStats()
        setupPostButton()
    }
    
    // MARK: - Set Up Views
    
    private func setupLogo() {
        logo.image = UIImage(named: "miniCornellTypesLogo")
        
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logo.widthAnchor.constraint(equalToConstant: 165),
            logo.heightAnchor.constraint(equalToConstant: 98)
        ])
    }
    
    private func setupPFP() {
        pfp.setBackgroundImage(UIImage(named: "bearprofile"), for: .normal)
        pfp.layer.masksToBounds = true
        pfp.addTarget(self, action: #selector(pushUserProfile), for: .touchUpInside)
        
        view.addSubview(pfp)
        pfp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pfp.centerYAnchor.constraint(equalTo: logo.centerYAnchor, constant: 10),
            pfp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            pfp.widthAnchor.constraint(equalToConstant: 108),
            pfp.heightAnchor.constraint(equalToConstant: 84)
        ])
    }
    
    private func setupExploreMBTITypes() {
        exploreMBTITypes.text = "explore mbti types"
        exploreMBTITypes.textColor = UIColor.hack.red
        exploreMBTITypes.font = UIFont(name: "Fredoka-Regular", size: 22)
        
        view.addSubview(exploreMBTITypes)
        exploreMBTITypes.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exploreMBTITypes.topAnchor.constraint(equalTo: pfp.bottomAnchor, constant: 21.95),
            exploreMBTITypes.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupMBTIStats() {
        mbtiStats.setTitle("mbti stats", for: .normal)
        mbtiStats.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        mbtiStats.setTitleColor(UIColor.hack.white, for: .normal)
        mbtiStats.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        mbtiStats.layer.cornerRadius = 16
        mbtiStats.addTarget(self, action: #selector(pushStats), for: .touchUpInside)
        
        view.addSubview(mbtiStats)
        mbtiStats.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mbtiStats.topAnchor.constraint(equalTo: exploreMBTITypes.bottomAnchor, constant: 118),
            mbtiStats.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            mbtiStats.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108),
            mbtiStats.widthAnchor.constraint(equalToConstant: 159),
            mbtiStats.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupPostButton() {
        postButton.setBackgroundImage(UIImage(named: "postbutton"), for: .normal)
        postButton.layer.cornerRadius = 33.025
        postButton.layer.masksToBounds = true
        postButton.addTarget(self, action: #selector(pushPost), for: .touchUpInside)
        
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.95),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 296),
            postButton.widthAnchor.constraint(equalToConstant: 66.05),
            postButton.heightAnchor.constraint(equalToConstant: 66.05)
        ])
    }
    
    @objc private func pushStats() {
        
    }
    
    @objc private func pushPost() {
        
    }
    
    @objc private func pushUserProfile() {
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
