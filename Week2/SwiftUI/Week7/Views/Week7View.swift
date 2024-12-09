//
//  Week7View.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct Week7View: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = Week7ViewModel()

    // MARK: - Hierarchy
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    BannerList(banners: $viewModel.banners)
                    AppHorizontalList(
                        apps: $viewModel.apps,
                        title: "아이폰 필수 앱",
                        subTitle: "에디터가 직접 고른 추천 앱으로 시작하세요"
                    )
                    AppHorizontalList(
                        apps: $viewModel.reversedApps,
                        title: "지금 주목해야 할 앱",
                        subTitle: "가위 아니고 보자기도 아니고 주목하세요"
                    )
                    AppHorizontalList(
                        apps: $viewModel.apps,
                        title: "무료 앱 순위",
                        subTitle: "앤솝 35기 위아요 파이팅하세요"
                    )
                    
                    Spacer()
                    
                }
            }
                .navigationTitle("앱")
            
        }
        .onAppear {
            viewModel.getBanners()
            viewModel.getApps()
        }
    }
}

#Preview {
    Week7View()
}
