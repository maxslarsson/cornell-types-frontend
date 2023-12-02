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
        
        backgroundColor = UIColor.hack.white
        layer.cornerRadius = 16
        
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
        message.text = post.text
    }
    
    // MARK: - Set Up Views
    
    private func setupUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        username.backgroundColor = UIColor.hack.blue
        username.layer.cornerRadius = 4
        username.titleLabel?.font = UIFont(name: "Fredoka-Regualar", size: 24)
        //username.addTarget(self, action: #selector(createProfile), for: touchUpInside)
        username.setTitleColor(UIColor.hack.white, for: .normal)
        contentView.addSubview(username)
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor , constant: -50),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupMessage() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont(name: "Fredoka-Regular", size:22)
        message.textColor = UIColor.hack.white
        contentView.addSubview(message)
        
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: contentView.topAnchor),
            message.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            message.heightAnchor.constraint(equalToConstant: 160)
        ])
        
    }
}

