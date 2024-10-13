//
//  RootTabBarController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

class RootTabBarController: UITabBarController {
    // MARK: - Properties
    let todayViewController = UIViewController()
    let gameViewController = UIViewController()
    let appViewController = UINavigationController(rootViewController: AppViewController())
    let arcadeViewController = UIViewController()
    let searchViewController = UIViewController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // MARK: - Set up Tab Bar
    private func setupTabBar() {
        // 각 ViewController의 tabBarItem과 tag를 설정
        todayViewController.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "text.rectangle.page"), tag: 0)
        gameViewController.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "bookmark"), tag: 1)
        appViewController.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 2)
        arcadeViewController.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "bookmark"), tag: 3)
        searchViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        /*
         tag는 뭔가요?
         
         tag는 탭 바의 탭을 구분하기 위한 요소(고유 번호, 고유 ID)
         */
        
//        self.tabBar.backgroundColor = .white // 탭바의 배경색 설정
//        self.tabBar.isTranslucent = true
        
        // 탭바가 관리하는 ViewController들 설정
        self.viewControllers = [todayViewController, gameViewController, appViewController, arcadeViewController, searchViewController]
    }
}
