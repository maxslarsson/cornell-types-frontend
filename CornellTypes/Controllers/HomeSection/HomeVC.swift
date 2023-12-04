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
    private let pfp = UIButton()
    private let forwardButton = UIButton()
    private let mbtiStats = UIButton()
    private let nameLabel = UILabel()
    private let postButton = UIButton()
    private let refreshControl = UIRefreshControl()
    private var postCollectionView: UICollectionView!
    
    // MARK: - Properties (data)
    
    private var posts: [Post] = []
    private var user: User!
    
    // MARK: - init
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        navigationItem.setHidesBackButton(true, animated: false)
        
        setupLogo()
        setupPFP()
        setupCollectionView()
        setupPostButton()
        setupMBTIStats()
        getPosts()
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
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 28
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuse)
        
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        postCollectionView.backgroundColor = UIColor.hack.white
        postCollectionView.showsVerticalScrollIndicator = false
        view.addSubview(postCollectionView)
        
        refreshControl.addTarget(self, action: #selector(getPosts), for: .valueChanged)
        postCollectionView.refreshControl = refreshControl
        
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 24),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupPostButton() {
        postButton.setBackgroundImage(UIImage(named: "postbutton"), for: .normal)
        postButton.layer.cornerRadius = 33
        postButton.layer.masksToBounds = true
        postButton.addTarget(self, action: #selector(pushPost), for: .touchUpInside)
        
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -21),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postButton.widthAnchor.constraint(equalToConstant: 66.05),
            postButton.heightAnchor.constraint(equalToConstant: 66.05)
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
            mbtiStats.topAnchor.constraint(equalTo: postButton.topAnchor),
            mbtiStats.bottomAnchor.constraint(equalTo: postButton.bottomAnchor),
            mbtiStats.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 108),
            mbtiStats.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -108),
        ])
    }
    
    @objc private func pushStats() {
         let vc = StatsVC()
         navigationController?.pushViewController(vc, animated: true)
     }

     @objc private func pushPost() {
         let vc = PostVC(user: user)
         navigationController?.pushViewController(vc, animated: true)
     }
    
    @objc private func getPosts() {
        NetworkManager.shared.getPosts { [weak self] posts in
            guard let self = self else { return }
            
            self.posts = posts
            
            DispatchQueue.main.async {
                self.postCollectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc private func pushUserProfile() {
        let vc = ProfileVC(user: user)
        navigationController?.pushViewController(vc, animated: true)
    }
}
    
// MARK: - UICollectionViewDelegate

extension HomeVC: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell {
            let post = posts[indexPath.row]
            cell.configure(post: post)
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 112)
    }
}

// MARK: - PostCollectionViewCellDelegate

extension HomeVC: PostCollectionViewCellDelegate {
    func goToUsersProfile(user: User) {
        let vc = UserProfileVC(user: user)
        navigationController?.pushViewController(vc, animated: true)
    }
}
