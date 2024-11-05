//
//  AppViewController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

class AppViewController: UIViewController {
    // MARK: - Properties
    private let appView = AppView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = appView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        let essentialTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapEssentialButton))
        appView.essentialAppButtonView.isUserInteractionEnabled = true
        appView.essentialAppButtonView.addGestureRecognizer(essentialTapGesture)
        
        let focusTapGesture = UITapGestureRecognizer(target: self, action: #selector(didtapFocusButton))
        appView.focusAppButtonView.isUserInteractionEnabled = true
        appView.focusAppButtonView.addGestureRecognizer(focusTapGesture)
        
        let selectedTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSelectedButton))
        appView.selectedAppButtonView.isUserInteractionEnabled = true
        appView.selectedAppButtonView.addGestureRecognizer(selectedTapGesture)
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        // delegate
        appView.topBannerCollectionView.dataSource = self
        appView.topBannerCollectionView.delegate = self
        
        appView.essentialAppCollectionView.dataSource = self
        appView.essentialAppCollectionView.delegate = self
        
        appView.focusAppCollectionView.dataSource = self
        appView.focusAppCollectionView.delegate = self
        
        appView.selectedAppCollectionView.dataSource = self
        appView.selectedAppCollectionView.delegate = self
        
        // register Cells
        appView.topBannerCollectionView.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.cellIdentifier)
        appView.essentialAppCollectionView.register(AppCollectionViewCell.self, forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)
        appView.focusAppCollectionView.register(AppCollectionViewCell.self, forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)
        appView.selectedAppCollectionView.register(AppCollectionViewCell.self, forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "앱"
    }
    
    // MARK: - Selectors
    @objc
    private func didTapEssentialButton() {
        let appListVC = AppListViewController()
        appListVC.setupTitle("iPhone 필수 앱")
//        appListVC.appModel = AppModel.mockData
        appListVC.dataBind(App.mockData)
        self.navigationController?.pushViewController(appListVC, animated: true)
    }
    
    @objc
    private func didtapFocusButton() {
        let appListVC = AppListViewController()
        appListVC.setupTitle("지금 주목해야 할 앱")
//        appListVC.appModel = AppModel.mockData.reversed()
        appListVC.dataBind(App.mockData.reversed())
        self.navigationController?.pushViewController(appListVC, animated: true)
    }
    
    @objc
    private func didTapSelectedButton() {
        let appListVC = AppListViewController()
        appListVC.setupTitle("에디터의 선택 시리즈")
//        appListVC.appModel = AppModel.mockData
        appListVC.dataBind(App.mockData)
        self.navigationController?.pushViewController(appListVC, animated: true)
    }
}

// MARK: - UICollectionView DataSource
extension AppViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == appView.topBannerCollectionView {
            return TopBanner.mockData.count
        }
        
        if collectionView == appView.essentialAppCollectionView {
            return App.mockData.count
        }
        
        if collectionView == appView.focusAppCollectionView {
            return App.mockData.count
        }
        
        if collectionView == appView.selectedAppCollectionView {
            return App.mockData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == appView.topBannerCollectionView {
            guard let topBannerCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TopBannerCell.cellIdentifier,
                for: indexPath
            ) as? TopBannerCell else {
                return UICollectionViewCell()
            }
            topBannerCell.configure(
                TopBanner.mockData[indexPath.row]
            )
            return topBannerCell
        }
        
        if collectionView == appView.essentialAppCollectionView || collectionView == appView.selectedAppCollectionView {
            guard let appCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? AppCollectionViewCell else {
                return UICollectionViewCell()
            }
            appCollectionViewCell.configure(with: indexPath.row, appModel: App.mockData[indexPath.row])
            return appCollectionViewCell
        }
        
        if collectionView == appView.focusAppCollectionView {
            guard let appCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? AppCollectionViewCell else {
                return UICollectionViewCell()
            }
            appCollectionViewCell.configure(with: indexPath.row, appModel: App.mockData.reversed()[indexPath.row])
            return appCollectionViewCell
        }
        
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension AppViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == appView.topBannerCollectionView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
        }
        
        if collectionView == appView.essentialAppCollectionView || collectionView == appView.focusAppCollectionView || collectionView == appView.selectedAppCollectionView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height/3)
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // mockData를 활용하기 때문에 임시로 index로 화면 이동
        if collectionView == appView.essentialAppCollectionView || collectionView == appView.selectedAppCollectionView {
            if indexPath.row == App.mockData.count - 1 {
                let detailVC = DetailViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
        
        if collectionView == appView.focusAppCollectionView {
            if indexPath.row == 0 {
                let detailVC = DetailViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
