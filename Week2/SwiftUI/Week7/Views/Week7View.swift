//
//  Week7View.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct Week7View: View {
    
    @State private var banners: [Banner] = []
    @State private var apps: [AppStoreApplication] = []
    
    // MARK: - Hierarchy
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    BannerList(banners: $banners)
                    AppHorizontalList(apps: $apps)
                    Spacer()
                }
            }
                .navigationTitle("앱")
        }
        .onAppear {
            getBanners()
            getApps()
        }
    }
    
    // MARK: - Funcs
    
    private func getBanners() {
        banners = Banner.mockData
    }
    
    private func getApps() {
        apps = AppStoreApplication.mockData
    }
}

#Preview {
    Week7View()
}
