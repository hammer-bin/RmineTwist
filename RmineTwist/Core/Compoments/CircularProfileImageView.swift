//
//  CircularProfileImageView.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/14/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: size.dimension, height: size.dimension)
            .foregroundColor(Color(.systemGray4))
    }
}

#Preview {
    CircularProfileImageView(size: .small)
}
