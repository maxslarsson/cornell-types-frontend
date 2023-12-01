//
//  OptionCollectionViewCell.swift
//  CornellTypes
//
//  Created by Max Larsson on 12/1/23.
//

import Foundation
import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    
    let answerLabel = UILabel()
    
    // MARK: - Properties (data)
    
    static let reuse: String = "OptionCollectionViewCellReuse"
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        
        setupAnswerLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(questionOption: QuestionOption, backgroundColor: UIColor) {
        DispatchQueue.main.async {
            self.backgroundColor = backgroundColor
            self.answerLabel.text = questionOption.optionText
        }
    }
    
    // MARK: - Set Up Views
    
    private func setupAnswerLabel() {
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = UIFont(name: "Fredoka-Medium", size: 22)
        answerLabel.textColor = .hack.white
        answerLabel.numberOfLines = 0
        contentView.addSubview(answerLabel)
        NSLayoutConstraint.activate([
            answerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
