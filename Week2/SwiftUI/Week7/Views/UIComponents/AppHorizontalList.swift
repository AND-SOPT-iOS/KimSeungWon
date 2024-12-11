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
    
    var title: String
    var subTitle: String
    
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
        NavigationLink {
            Week6View(title: title)
        } label: {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 10) {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color(hex: "000000"))
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 9, height: 15)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color(hex: "737373"))
                    
                    Spacer()
                }
                
                Text(subTitle)
                    .font(.system(size: 14))
                    .foregroundStyle(Color(hex: "A5A5A5"))
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var appList: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(apps.indices, id: \.self) { index in
                    NavigationLink {
                        // 토스 디테일 뷰 
                        EmptyView()
                    } label: {
                        AppHorizontalListCell(app: apps[index], index: index)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
