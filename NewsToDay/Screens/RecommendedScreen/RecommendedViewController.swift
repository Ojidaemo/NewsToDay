//
//  RecommendedViewController.swift
//  NewsToDay
//
//  Created by Vitali Martsinovich on 2023-05-10.
//

import UIKit

class RecommendedViewController: UIViewController {

    private let tableView = RecommendedTableView()
    private let topTitleLabel = UILabel()

    var news: [Result] = [] {
        didSet {
            tableView.news = news
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.delegateRecommendedTableCell = self
    }

    private func configureToptitleLabel() {
        topTitleLabel.text = "Recommended for you".localized
        topTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        topTitleLabel.textColor = .black
        topTitleLabel.textAlignment = .left
        topTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(topTitleLabel)
        configureToptitleLabel()
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            topTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),

            tableView.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}

extension RecommendedViewController: RecommendedTableProtocol {
    func cellTapped(selectedArticle: Result) {
        let vc = DetailedViewController()
        vc.configureScreen(selectedArticle: selectedArticle)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
