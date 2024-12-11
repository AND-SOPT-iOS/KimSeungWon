//
//  AppDetailView.swift
//  Week2
//
//  Created by 김승원 on 12/11/24.
//

import SwiftUI

struct AppDetailView: View {
    
    @State var app: AppStoreApplication
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(spacing: 0) {
            AppDetailTitlesAndButtonView(app: app)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                app.appIcon
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex: "F4F4F4"), lineWidth: 1)
                    )
            }
        }
    }
}


#Preview {
    AppDetailView(app:
                    AppStoreApplication(
                        id: UUID(),
                        appIcon: Image(.toss),
                        title: "현대카드",
                        subTitle: "카드 생활을 넘어 자산 관리까지 하나의 앱으로!",
                        buttonState: .download
                    )
    )
}
