//
//  Preview.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit

struct Preview {
    let previewPhoto: UIImage
}


extension Preview {
    static let mockData: [Preview] = [
        Preview(previewPhoto: .firstPreview),
        Preview(previewPhoto: .secondPreview),
        Preview(previewPhoto: .firstPreview),
        Preview(previewPhoto: .secondPreview),
        Preview(previewPhoto: .firstPreview)
    ]
}
