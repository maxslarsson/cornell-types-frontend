//
//  PostCollectionViewCell.swift
//  CornellTypes
//
//  Created by David Lee on 12/1/23.
//

import Foundation
import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties (view)
    let image = UIImageView()
    let username = UIButton()
    let message = UILabel()
    let background = UIImageView()
    let circle = UIImageView()
    
    // MARK: - Properties (data)
    static let reuse: String = "PostCollectionViewCellReuse"
    private var post: Post!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUsername()
        setupBackground()
        setupMessage()
        setupCircle()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(post: Post) {
        self.post = post
        
        DispatchQueue.main.async {
            self.updateUI()
        }
    }
    
    // MARK: - Update UI
    
    /// Update UI to match the contents of the `post` property
    func updateUI() {
        username.setTitle(post.user, for: .normal)
        username.titleLabel?.font = UIFont(name: "Fredoka-Medium", size: 22)
        message.text = post.text
        
        NetworkManager.shared.getUserByUsername(username: post.user) { [weak self] user in
            guard let self = self else { return }
            self.image.image = UIImage(named: "\(user.personality.lowercased())bear")
            switch user.personality {
            case "INFJ", "INFP", "ENFJ", "ENFP":
                username.setBackgroundImage(UIImage(named: "greenuserrect"), for: .normal)
                background.image = UIImage(named: "greenrect")
            case "INTJ", "INTP", "ENTJ", "ENTP":
                username.setBackgroundImage(UIImage(named: "purpleuserrect"), for: .normal)
                background.image = UIImage(named: "purplerect")
            case "ISTP", "ISFP", "ESTP", "ESFP":
                username.setBackgroundImage(UIImage(named: "yellowuserrect"), for: .normal)
                background.image = UIImage(named: "yellowrect")
            case "ISTJ", "ISFJ", "ESTJ", "ESFJ":
                username.setBackgroundImage(UIImage(named: "blueuserrect"), for: .normal)
                background.image = UIImage(named: "bluerect")
            default:
                print(user.personality)
            }
        }
    }
    
    // MARK: - Set Up Views
    
    private func setupUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        username.layer.cornerRadius = 10
        //username.addTarget(self, action: #selector(pushUserProfile), for: .touchUpInside)
        username.setTitleColor(UIColor.hack.white, for: .normal)
        
        contentView.addSubview(username)
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 53),
            username.widthAnchor.constraint(equalToConstant: 108),
            username.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func setupMessage() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont(name: "Fredoka-Medium", size: 22)
        message.textColor = UIColor.hack.white
        message.layer.cornerRadius = 10
        message.layer.masksToBounds = true
        //message.backgroundColor = UIColor(red: 0.895, green: 0.706, blue: 0.985, alpha: 1)
        
        
        contentView.addSubview(message)
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: username.bottomAnchor),
            message.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: -10),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            image.widthAnchor.constraint(equalToConstant: 53),
            image.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    private func setupCircle() {
        circle.image = UIImage(named: "circle")
        
        contentView.addSubview(circle)
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            circle.topAnchor.constraint(equalTo: contentView.topAnchor),
            circle.widthAnchor.constraint(equalToConstant: 66),
            circle.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
    
    private func setupBackground() {
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: username.bottomAnchor, constant: -3),
            background.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: -30),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
//    @objc private func pushUserProfile() {
//        NetworkManager.shared.getUserByUsername(username: post.user) { [weak self] user in
//            guard let self = self else { return }
//            let vc = UserProfileVC(user: user)
//            navigationController?.pushViewController(vc, animated: true)
//   }
}

