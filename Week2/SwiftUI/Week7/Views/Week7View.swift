//
//  Week7View.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct Week7View: View {
    
    @State private var banners: [Banner] = []
    
    // MARK: - Hierarchy
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    bannerList
                    Spacer()
                }
            }
                .navigationTitle("앱")
        }
        .onAppear {
            getBanners()
        }
    }
    
    // MARK: - UI Components
    
    var bannerList: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(banners) { banner in
                    BannerCell(banner: banner)
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
    
    // MARK: - Funcs
    
    private func getBanners() {
        banners = Banner.mockData
    }
}

#Preview {
    Week7View()
}
