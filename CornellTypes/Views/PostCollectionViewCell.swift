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
    }
    
    // MARK: - Set Up Views
    
    private func setupUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        username.backgroundColor = UIColor.hack.green
        username.layer.cornerRadius = 10
        //username.addTarget(self, action: #selector(createProfile), for: touchUpInside)
        username.setTitleColor(UIColor.hack.white, for: .normal)
        contentView.addSubview(username)
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            username.widthAnchor.constraint(equalToConstant: 108),
            username.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func setupMessage() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont(name: "Fredoka-Medium", size: 22)
        message.textColor = UIColor.hack.white
        contentView.addSubview(message)
        message.layer.cornerRadius = 10
        message.layer.masksToBounds = true
        message.backgroundColor = UIColor.hack.green
        
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: username.bottomAnchor),
            message.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            message.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}

