//
//  AppListViewController.swift
//  Week2
//
//  Created by 김승원 on 11/1/24.
//

import UIKit

class AppListViewController: UIViewController {
    // MARK: - Properties
    private let appListView = AppListView()
    private var appModels: [AppModel] = []

    // MARK: - Life Cycle
    override func loadView() {
        self.view = appListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    // MARK: - dataBind
    func dataBind(_ appModels: [AppModel]) {
        self.appModels = appModels
    }
    
    // MARK: - Set up TableView
    private func setupTableView() {
        appListView.tableView.separatorStyle = .none
        
        // delegate
        appListView.tableView.dataSource = self
        appListView.tableView.delegate = self
        
        // register cells
        appListView.tableView.register(AppTableViewCell.self, forCellReuseIdentifier: AppTableViewCell.cellIdentifier)
    }
    
    // MARK: - Set up NavigationBar
    func setupTitle(_ title: String) {
        self.title = title
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - UITableView DataSource
extension AppListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppModel.mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let appTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: AppTableViewCell.cellIdentifier,
            for: indexPath
        ) as? AppTableViewCell else {
            return UITableViewCell()
        }
        appTableViewCell.configure(appModels[indexPath.row])
        return appTableViewCell
    }
}

// MARK: - UITableView Delegate
extension AppListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if appModels[indexPath.row].title == "토스" {
            let detailVC = DetailViewController()
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
