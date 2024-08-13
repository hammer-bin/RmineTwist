//
//  UserDetail.swift
//  RmineTwist
//
//  Created by minkyuLee on 8/14/24.
//

import SwiftUI

struct UserDetail: View {
    let user: User
    
    var body: some View {
        Text(user.data.lastName)
    }
}

//#Preview {
//    UserDetail(user: User)
//}
