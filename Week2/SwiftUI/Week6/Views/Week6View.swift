//
//  Week6View.swift
//  Week2
//
//  Created by 김승원 on 11/26/24.
//

import SwiftUI

struct Week6View: View {
    
    @StateObject private var viewModel = Week6ViewModel()
    
    var title: String
    
    var body: some View {
        List(viewModel.apps) { app in
            ZStack {
                NavigationLink {
                    AppDetailView(app: app)
                } label: {
                    EmptyView()
                }
                .opacity(0)
                
                AppRow(app: app)
            }
        }
        
        .listStyle(.plain)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getAppStoreApplications()
        }
    }
}

#Preview {
    Week6View(title: "아이폰 필수 앱")
}
