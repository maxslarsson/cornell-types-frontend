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
    
    // MARK: - Properties (data)
    static let reuse: String = "PostCollectionViewCellReuse"
    private var post: Post!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUsername()
        setupMessage()
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
        }
    }
    
    // MARK: - Set Up Views
    
    private func setupUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        username.backgroundColor = UIColor(red: 0.895, green: 0.706, blue: 0.985, alpha: 1)
        username.layer.cornerRadius = 10
        //username.addTarget(self, action: #selector(createProfile), for: touchUpInside)
        username.setTitleColor(UIColor.hack.white, for: .normal)
        
        contentView.addSubview(username)
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
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
        message.backgroundColor = UIColor(red: 0.895, green: 0.706, blue: 0.985, alpha: 1)
        
        contentView.addSubview(message)
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: username.bottomAnchor),
            message.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: -30),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .hack.white
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 66/2
        image.layer.masksToBounds = true
        
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.widthAnchor.constraint(equalToConstant: 66),
            image.heightAnchor.constraint(equalToConstant: 66),
        ])
    }
}

