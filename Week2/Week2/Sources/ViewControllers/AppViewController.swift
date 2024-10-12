//
//  AppViewController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    // MARK: - UI Components
    private let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "appIcon")
        iv.contentMode = .scaleAspectFill
//        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let appNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "토스"
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .label
        lb.textAlignment = .left
        return lb
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setNavigationBar()
    }
    
    // MARK: - Set NavigationBar
    private func setNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "앱"
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.view.addSubviews(appImageView, appNameLabel)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        appImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.size.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.top)
            make.leading.equalTo(appImageView.snp.trailing).offset(15)
        }
    }
}
