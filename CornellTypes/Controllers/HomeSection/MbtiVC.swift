//
//  MbtiVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 12/3/23.
//

import UIKit

class MbtiVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let type = UIImageView()
    private let tape = UIImageView()
    private let square = UIImageView()
    private let bear = UIImageView()
    private let desc = UILabel()
    private let backButton = UIButton()
    
    // MARK: - Properties (data)
    
    private var user: OtherUser!
    private var personality: String!
    
    // MARK: - init
    
    init(user: OtherUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupType()
        setupSquare()
        setupBear()
        setupTape()
        setupDesc()
        setupBackButton()
    }
    
    // MARK: - Views
    
    private func setupType() {
        type.image = UIImage(named: personality.lowercased())
        
        view.addSubview(type)
        type.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            type.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 89),
            type.widthAnchor.constraint(equalToConstant: 218),
            type.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    private func setupTape() {
        tape.image = UIImage(named: "tape")
        
        view.addSubview(tape)
        tape.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tape.topAnchor.constraint(equalTo: view.topAnchor, constant: 189),
            tape.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
            tape.widthAnchor.constraint(equalToConstant: 134),
            tape.heightAnchor.constraint(equalToConstant: 26)
        ])
        
    }
    
    private func setupSquare() {
        square.image = UIImage(named: "square")
        
        view.addSubview(square)
        square.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            square.topAnchor.constraint(equalTo: view.topAnchor, constant: 202),
            square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            square.widthAnchor.constraint(equalToConstant: 259),
            square.heightAnchor.constraint(equalToConstant: 228)
        ])
        
    }
    
    private func setupBear() {
        bear.image = UIImage(named: ("\(personality!)bear").lowercased())
        
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 207),
            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            bear.widthAnchor.constraint(equalToConstant: 208.87),
            bear.heightAnchor.constraint(equalToConstant: 223)
        ])
    }
    
    private func setupDesc() {
        switch personality {
            case "INFJ":
                desc.text = "Quiet and mystical, yet very inspiring and tireless idealists."
            case "INFP":
                desc.text = "Poetic, kind and altruistic people, always eager to help a good cause."
            case "ENFJ":
                desc.text = "Charismatic and inspiring leaders, able to mesmerize their listeners."
            case "ENFP":
                desc.text = "Enthusiastic, creative and sociable free spirits, who can always find a reason to smile"
            case "INTJ":
                desc.text = "Imaginative and strategic thinkers, with a plan for everything."
            case "INTP":
                desc.text = "Innovative inventors with an unquenchable thirst for knowledge."
            case "ENTJ":
                desc.text = "Bold, imaginative and strong-willed leaders, always finding a way - or making one."
            case "ENTP":
                desc.text = "Smart and curious thinkers who cannot resist an intellectual challenge."
            case "ISTP":
                desc.text = "Bold and practical experimenters, masters of all kinds of tools."
            case "ISFP":
                desc.text = "Flexible and charming artists, always ready to explore and experience something new."
            case "ESTP":
                desc.text = "Smart, energetic and very perceptive people, who truly enjoy living on the edge."
            case "ESFP":
                desc.text = "Spontaneous, energetic and enthusiastic people – life is never boring around them."
            case "ISTJ":
                desc.text = "Practical and fact-minded individuals, whose reliability cannot be doubted."
            case "ISFJ":
                desc.text = "Very dedicated and warm protectors, always ready to defend their loved ones."
            case "ESTJ":
                desc.text = "Excellent administrators, unsurpassed at managing things – or people."
            case "ESFJ":
                desc.text = "Extraordinarily caring, social and popular people, always eager to help."
            default:
                print(personality!)
        }
        
        desc.textColor = UIColor.hack.red
        desc.font = UIFont(name: "Fredoka-Regular", size: 21)
        desc.numberOfLines = 0
        
        view.addSubview(desc)
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desc.topAnchor.constraint(equalTo: view.topAnchor, constant: 443),
            desc.widthAnchor.constraint(equalToConstant: 259)
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
    
    
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}


