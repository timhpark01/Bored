//
//  BoredCircleView.swift
//  Bored
//
//  Created by Nathan Park on 7/11/23.
//

import Foundation
import SwiftUI

struct BoredCircleComponent: View {
    var width: CGFloat
    var height: CGFloat
    var text: String? // Optional input for the string
    
    var body: some View {
        ZStack {
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .frame(width: width, height: height)
            
            if let text = text { // Display the text if it exists
                Text(text)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

