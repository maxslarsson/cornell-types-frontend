//
//  QuizVC.swift
//  CornellTypes
//
//  Created by Max Larsson on 12/1/23.
//

import UIKit

class QuizVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let titleLabel = UILabel()
    private let bearImageView = UIImageView()
    private let questionLabel = UILabel()
    private var optionsCollectionView: UICollectionView!
    
    // MARK: - Properties (data)
    
    private var user: User!
    private var question: Question?
    private static let buttonColors = [
        UIColor.hack.purple,
        UIColor.hack.blue,
    ]
    private static let bearImages = [
        UIImage(named: "bearreading"),
        UIImage(named: "bearcozy"),
        UIImage(named: "bearcelebration"),
        UIImage(named: "beartwo"),
        UIImage(named: "bearsneaky"),
    ]
    
    // MARK: - init
    
    init(questionId: Int, user: User) {
        super.init(nibName: nil, bundle: nil)
        
        self.user = user
        NetworkManager.shared.getQuestion(questionId: questionId) { [weak self] question in
            guard let self = self else { return }
            self.question = question
            
            DispatchQueue.main.async {
                self.setupTitleLabel()
                self.setupQuestionLabel()
                self.setupBearImageView()
                self.optionsCollectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        navigationItem.hidesBackButton = true
        
        setupTitleLabel()
        setupBearImageView()
        setupQuestionLabel()
        setupOptionsCollectionView()
    }
    
    // MARK: - Set Up Views
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "\(question?.questionNo ?? 0)/36"
        titleLabel.font = UIFont(name: "Fredoka-Regular", size: 22)
        titleLabel.textColor = .hack.red
        navigationItem.titleView = self.titleLabel
    }
    
    private func setupBearImageView() {
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        let index = (question?.questionNo ?? 0) % QuizVC.bearImages.count
        bearImageView.image = QuizVC.bearImages[index]
        bearImageView.contentMode = .scaleAspectFit
        view.addSubview(bearImageView)
        NSLayoutConstraint.activate([
            bearImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            bearImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            bearImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            bearImageView.heightAnchor.constraint(equalToConstant: 285),
        ])
    }
    
    private func setupQuestionLabel() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = question?.questionText ?? "Loading..."
        questionLabel.font = UIFont(name: "Fredoka-Regular", size: 22)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .hack.red
        questionLabel.textAlignment = .center
        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 30),
            questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    private func setupOptionsCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        optionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        optionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        optionsCollectionView.register(OptionCollectionViewCell.self, forCellWithReuseIdentifier: OptionCollectionViewCell.reuse)
        optionsCollectionView.delegate = self
        optionsCollectionView.dataSource = self
        optionsCollectionView.backgroundColor = UIColor.hack.white
        optionsCollectionView.showsVerticalScrollIndicator = false
        view.addSubview(optionsCollectionView)
        NSLayoutConstraint.activate([
            optionsCollectionView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 60),
            optionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            optionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            optionsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension QuizVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Safe because a cell is only rendered if options exists (see numberOfItemsInSection below)
        let nextQuestionId = question!.id + 1
        
        let score = question!.options[indexPath.row].score
        NetworkManager.shared.submitSpecificResponse(user: user, questionId: question!.id, score: score) {
            if nextQuestionId == 37 {
                NetworkManager.shared.getResults(user: self.user) { [weak self] user in
                    guard let self = self else { return }
                    let vc = QuizResultVC(user: user)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                let vc = QuizVC(questionId: nextQuestionId, user: self.user)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension QuizVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCollectionViewCell.reuse, for: indexPath) as? OptionCollectionViewCell {
            // Safe because a cell is only rendered of options exists (see numberOfItemsInSection below)
            let questionOption = question!.options[indexPath.row]
            let backgroundColor = QuizVC.buttonColors[indexPath.row % QuizVC.buttonColors.count]
            cell.configure(questionOption: questionOption, backgroundColor: backgroundColor)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return question?.options.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension QuizVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width/2.1, height: 140)
    }
    
}
