//
//  BannerList.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct BannerList: View {
    
    let rows = [
        GridItem()
    ]
    @Binding var banners: [Banner]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(banners) { banner in
                        BannerCell(banner: banner)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}
