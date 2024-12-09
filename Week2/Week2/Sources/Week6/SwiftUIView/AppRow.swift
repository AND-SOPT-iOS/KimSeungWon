//
//  AppRow.swift
//  Week2
//
//  Created by 김승원 on 11/26/24.
//

import SwiftUI

struct AppRow: View {
    
    // MARK: - Hierarchy
    
    var app: AppStoreApplication
    var body: some View {
        HStack(alignment:.center, spacing: 14) {
            appIcon
            VStack(alignment: .leading, spacing: 0) {
                titles
                Spacer()
                BasicAppButton(app: app)
            }
            Spacer()
        }
        .frame(height: 85)
    }
    
    // MARK: - UI Components
    
    var appIcon: some View {
        app.appIcon
            .resizable()
            .frame(width: 85, height: 85)
            .clipShape(RoundedRectangle(cornerRadius: 17))
    }
    
    var titles: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(app.title)
                .font(.system(size: 15, weight: .bold))
                .lineLimit(1)
            Text(app.subTitle)
                .foregroundStyle(.secondary)
                .font(.system(size: 13, weight: .regular))
                .lineLimit(1)
        }
    }
}

#Preview {
    AppRow(app: AppStoreApplication.mockData[2])
}
