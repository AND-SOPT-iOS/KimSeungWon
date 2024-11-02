//
//  RootTabBarController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

class RootTabBarController: UITabBarController {
    // MARK: - Tabs Enum
    enum Tab: Int, CaseIterable {
        case today
        case game
        case app
        case arcade
        case search
        
        var title: String {
            switch self {
            case .today: return "투데이"
            case .game: return "게임"
            case .app: return "앱"
            case .arcade: return "Arcade"
            case .search: return "검색"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .today: return UIImage(systemName: "text.rectangle.page")
            case .game: return UIImage(systemName: "bookmark")
            case .app: return UIImage(systemName: "square.stack.3d.up.fill")
            case .arcade: return UIImage(systemName: "bookmark")
            case .search: return UIImage(systemName: "magnifyingglass")
            }
        }
        
        func viewController() -> UIViewController {
            switch self {
            case .today: return UINavigationController(rootViewController: ServerViewController())
            case .game: return UIViewController()
            case .app: return UINavigationController(rootViewController: AppViewController())
            case .arcade: return UIViewController()
            case .search: return UIViewController()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // MARK: - Set up Tab Bar
    private func setupTabBar() {
        let viewControllers = Tab.allCases.map { tab -> UIViewController in
            let viewController = tab.viewController()
            viewController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: tab.rawValue)
            return viewController
        }
        
        self.viewControllers = viewControllers
    }
}
