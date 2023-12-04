//
//  PostVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 12/3/23.
//

import UIKit

class PostVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let newPost = UILabel()
    private let input = UITextField()
    private let postButton = UIButton()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var user: User!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupNewPost()
        setupInput()
        setupPost()
        setupBackButton()
    }
    
    // MARK: - Views
    
    private func setupNewPost() {
        newPost.text = "new post"
        newPost.textColor = UIColor.hack.red
        newPost.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(newPost)
        newPost.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newPost.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            newPost.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupInput() {
        input.layer.borderColor = UIColor.hack.red.cgColor
        input.layer.borderWidth = 2
        input.layer.cornerRadius = 11
        input.autocapitalizationType = .none
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: input.frame.height))
        
        input.leftView = paddingView
        input.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.hack.darkpink,
                .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
            
        let attributedPlaceholder = NSAttributedString(string: "bio here", attributes: placeholderAttributes)
            
        input.attributedPlaceholder = attributedPlaceholder
        view.addSubview(input)
        input.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            input.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            input.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            input.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            input.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -342)
        ])
    }
    
    private func setupPost() {
        postButton.setTitle("post", for: .normal)
        postButton.titleLabel!.font = UIFont(name: "Fredoka-Medium", size: 22)
        postButton.setTitleColor(UIColor.hack.white, for: .normal)
        postButton.setBackgroundImage(UIImage(named: "tanrect"), for: .normal)
        postButton.layer.cornerRadius = 16
        postButton.addTarget(self, action: #selector(pushHome), for: .touchUpInside)
        
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 394),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 212),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            postButton.heightAnchor.constraint(equalToConstant: 60)
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
    
    @objc private func pushHome() {
        
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
