//
//  Week7ViewModel.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import Foundation

final class Week7ViewModel: ObservableObject {
    
    @Published var banners: [Banner] = []
    @Published var apps: [AppStoreApplication] = []
    
    // MVVM 적용하기 위해 api 호출하는 것처럼 mockData를 불러옵니다.
    func getBanners() {
        banners = Banner.mockData
    }
    
    func getApps() {
        apps = AppStoreApplication.mockData
    }
    
}
