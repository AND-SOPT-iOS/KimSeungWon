//
//  Week6ViewModel.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import Foundation

final class Week6ViewModel: ObservableObject {
    
    @Published var apps: [AppStoreApplication] = []
    
    func getAppStoreApplications() {
        // MVVM 적용하기 위해 api 호출하는 것처럼 mockData를 불러옵니다.
        apps = AppStoreApplication.mockData
    }
    
}
