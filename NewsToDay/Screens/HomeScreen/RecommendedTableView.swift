//
//  RecommendedTableView.swift
//  NewsAPI
//
//  Created by Vitali Martsinovich on 2023-05-06.
//

import UIKit
import SnapKit

protocol RecommendedTableProtocol: AnyObject {
    func cellTapped(selectedArticle: Result)
}

class RecommendedTableView: UITableView {
   
    weak var delegateRecommendedTableCell: RecommendedTableProtocol?
    
    var news: [Result] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureTable()
    }
    
    func configureTable() {
        rowHeight = 100
        separatorStyle = .none
        backgroundColor = .clear
        register(RecommendedCell.self, forCellReuseIdentifier: RecommendedCell.identifier)
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Delegate
extension RecommendedTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedCell.identifier, for: indexPath) as? RecommendedCell else {
            return UITableViewCell()
        }
        cell.configureCell(news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let selectedArticle = self.news[indexPath.row]
        delegateRecommendedTableCell?.cellTapped(selectedArticle: selectedArticle)
    }
}
