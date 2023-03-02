//
//  circleimage.swift
//  Bored
//
//  Created by Timothy Park on 2/28/23.
//

import SwiftUI

struct circleimage: View {
    var body: some View {

        Image("IMG_2376")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth:4)
            }
            .shadow(radius: 7)
    }
}

struct circleimage_Previews: PreviewProvider {
    static var previews: some View {
        circleimage()
    }
}
