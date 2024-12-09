//
//  AppHorizontalList.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct AppHorizontalList: View {
    
    // MARK: - Properties
    
    @Binding var apps: [AppStoreApplication]
    
    let rows = [
        GridItem(.fixed(72)),
        GridItem(.fixed(72)),
        GridItem(.fixed(72))
    ]
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(spacing: 15) {
            titleButton
            appList
        }
    }
    
    // MARK: - UI Components
    
    private var titleButton: some View {
        Button {
            print("앱 리스트 이동 버튼")
        } label: {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 5) {
                    Text("iPhone 필수 앱")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color(hex: "000000"))
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 16)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color(hex: "737373"))
                    
                    Spacer()
                }
                
                Text("에디터가 직접 고른 추천 앱으로 시작하세요")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "A5A5A5"))
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var appList: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(apps.indices, id: \.self) { index in
                    AppHorizontalListCell(app: apps[index], index: index)
                }
            }
            .padding(.horizontal, 20)
        }

        .scrollIndicators(.hidden)
    }
    
}
