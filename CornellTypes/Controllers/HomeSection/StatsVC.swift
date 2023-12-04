//
//  StatsVC.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 12/3/23.
//

import UIKit

class StatsVC: UIViewController {
    
    // MARK: - Properties (views)
    
    private let mbtiStats = UILabel()
    private let stat1 = UIImageView()
    private let stat2 = UIImageView()
    private let stat3 = UIImageView()
    private let stat4 = UIImageView()
    private let stat5 = UIImageView()
    private let stat1Label = UILabel()
    private let stat2Label = UILabel()
    private let stat3Label = UILabel()
    private let stat4Label = UILabel()
    private let stat5Label = UILabel()
    private let bear = UIImageView()
    private let backButton = UIButton()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hack.white
        
        setupMBTIStats()
        setupStat1()
        setupStat2()
        setupStat3()
        setupStat4()
        setupStat5()
        setupStat1Label()
        setupStat2Label()
        setupStat3Label()
        setupStat4Label()
        setupStat5Label()
        setupBear()
        setupBackButton()
    }
    
    // MARK: - Views
    
    private func setupMBTIStats() {
        mbtiStats.text = "mbti stats"
        mbtiStats.textColor = UIColor.hack.red
        mbtiStats.font = UIFont(name: "Fredoka-Regular", size: 28.48)
        
        view.addSubview(mbtiStats)
        mbtiStats.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mbtiStats.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            mbtiStats.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupStat1() {
        stat1.image = UIImage(named: "37%")
        
        view.addSubview(stat1)
        stat1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat1.topAnchor.constraint(equalTo: view.topAnchor, constant: 117),
            stat1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stat1.widthAnchor.constraint(equalToConstant: 80),
            stat1.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupStat2() {
        stat2.image = UIImage(named: "12%")
        
        view.addSubview(stat2)
        stat2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat2.topAnchor.constraint(equalTo: view.topAnchor, constant: 186),
            stat2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stat2.widthAnchor.constraint(equalToConstant: 80),
            stat2.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupStat3() {
        stat3.image = UIImage(named: "27%")
        
        view.addSubview(stat3)
        stat3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat3.topAnchor.constraint(equalTo: view.topAnchor, constant: 262),
            stat3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stat3.widthAnchor.constraint(equalToConstant: 80),
            stat3.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupStat4() {
        stat4.image = UIImage(named: "6%")
        
        view.addSubview(stat4)
        stat4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat4.topAnchor.constraint(equalTo: view.topAnchor, constant: 333),
            stat4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stat4.widthAnchor.constraint(equalToConstant: 65),
            stat4.heightAnchor.constraint(equalToConstant: 37)
        ])
    }
    
    private func setupStat5() {
        stat5.image = UIImage(named: "18%")
        
        view.addSubview(stat5)
        stat5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat5.topAnchor.constraint(equalTo: view.topAnchor, constant: 410),
            stat5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stat5.widthAnchor.constraint(equalToConstant: 80),
            stat5.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupStat1Label() {
        stat1Label.text = "of aap students are ENFPs"
        stat1Label.textColor = UIColor.hack.red
        stat1Label.font = UIFont(name: "Fredoka-Regular", size: 22)
        stat1Label.numberOfLines = 0
        
        view.addSubview(stat1Label)
        stat1Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 106),
            stat1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            stat1Label.widthAnchor.constraint(equalToConstant: 233),
            stat1Label.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupStat2Label() {
        stat2Label.text = "of cals students are ESFJs"
        stat2Label.textColor = UIColor.hack.red
        stat2Label.font = UIFont(name: "Fredoka-Regular", size: 22)
        stat2Label.numberOfLines = 0
        
        view.addSubview(stat2Label)
        stat2Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 181),
            stat2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            stat2Label.widthAnchor.constraint(equalToConstant: 233),
            stat2Label.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupStat3Label() {
        stat3Label.text = "of ilries are INTPs"
        stat3Label.textColor = UIColor.hack.red
        stat3Label.font = UIFont(name: "Fredoka-Regular", size: 22)
        stat3Label.numberOfLines = 0
        
        view.addSubview(stat3Label)
        stat3Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat3Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 255),
            stat3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            stat3Label.widthAnchor.constraint(equalToConstant: 233),
            stat3Label.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupStat4Label() {
        stat4Label.text = "of engineers are ENTPs"
        stat4Label.textColor = UIColor.hack.red
        stat4Label.font = UIFont(name: "Fredoka-Regular", size: 22)
        stat4Label.numberOfLines = 0
        
        view.addSubview(stat4Label)
        stat4Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat4Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 326),
            stat4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            stat4Label.widthAnchor.constraint(equalToConstant: 233),
            stat4Label.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupStat5Label() {
        stat5Label.text = "of cas students are ISFPs"
        stat5Label.textColor = UIColor.hack.red
        stat5Label.font = UIFont(name: "Fredoka-Regular", size: 22)
        stat5Label.numberOfLines = 0
        
        view.addSubview(stat5Label)
        stat5Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stat5Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 398),
            stat5Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142),
            stat5Label.widthAnchor.constraint(equalToConstant: 233),
            stat5Label.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupBear() {
        bear.image = UIImage(named: "bearthinking")
        
        view.addSubview(bear)
        bear.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bear.topAnchor.constraint(equalTo: view.topAnchor, constant: 433),
            bear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            bear.widthAnchor.constraint(equalToConstant: 313),
            bear.heightAnchor.constraint(equalToConstant: 445)
        ])
    }
    
    private func setupBackButton() {
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 14),
            backButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
