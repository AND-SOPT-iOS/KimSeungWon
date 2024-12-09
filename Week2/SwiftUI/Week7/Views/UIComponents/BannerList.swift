//
//  BannerList.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct BannerList: View {
    
    @Binding var banners: [Banner]
    
    var body: some View {
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
}
