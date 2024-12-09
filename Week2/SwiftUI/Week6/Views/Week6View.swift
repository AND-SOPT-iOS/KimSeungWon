//
//  Week6View.swift
//  Week2
//
//  Created by 김승원 on 11/26/24.
//

import SwiftUI

struct Week6View: View {
    
    @StateObject private var viewModel = Week6ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.apps) { app in
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
            viewModel.getAppStoreApplications()
        }
    }
    
    var backButton: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.left")
        }
    }

}

#Preview {
    Week6View()
}
