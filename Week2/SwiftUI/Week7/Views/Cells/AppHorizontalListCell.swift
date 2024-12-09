//
//  AppHorizontalListCell.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct AppHorizontalListCell: View {
    
    var app: AppStoreApplication
    var index: Int
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(spacing: 5) {
                appImage
                titles
                Spacer()
                BasicAppButton(app: app)
            }
            .padding(.bottom, 10)
            
            separator()
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 68)
    }
    
    // MARK: - UI Components
    
    private var appImage: some View {
        app.appIcon
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "F4F4F4"), lineWidth: 1)
            )
    }
    
    private var titles: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(app.title)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(Color(hex: "000000"))
                .lineLimit(1)
            Text(app.subTitle)
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(Color(hex: "A5A5A5"))
                .lineLimit(2)
        }
    }
    
    // MARK: - Funcs
    
    func separator() -> some View {
        Group {
            if index % 3 != 2 {
                Rectangle()
                    .foregroundStyle(Color(hex: "F4F4F4"))
                    .frame(width: UIScreen.main.bounds.width - 105, height: 1)
            } else {
                EmptyView()
            }
        }
        
    }
}
//#Preview {
//    AppHorizontalListCell()
//}
