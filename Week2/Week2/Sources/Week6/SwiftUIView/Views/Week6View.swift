//
//  Week6View.swift
//  Week2
//
//  Created by 김승원 on 11/26/24.
//

import SwiftUI

struct Week6View: View {
    
    @State private var apps: [AppStoreApplication] = []
    
    var body: some View {
        NavigationView {
            List(apps) { app in
                AppRow(app: app)
            }
            
            .listStyle(.plain)
            .navigationTitle("iPhone 필수 앱")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button {
                        print("backButton Tapped")
                    } label: {
                        backButton
                    }
            )
        }
        .onAppear {
            getAppStoreApplications()
        }
    }
    
    var backButton: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    // MARK: - Funcs
    
    private func getAppStoreApplications() {
        // MVVM 적용하기 위해 api 호출하는 것처럼 mockData를 불러옵니다.
        apps = AppStoreApplication.mockData
    }
}

#Preview {
    Week6View()
}
