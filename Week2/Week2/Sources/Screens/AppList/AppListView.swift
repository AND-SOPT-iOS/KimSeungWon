//
//  AppListView.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit
import SnapKit

class AppListView: UIView {
    // MARK: - UI Components
    lazy var tableView = UITableView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.backgroundColor = .systemBackground
        
        self.addSubviews(tableView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
