//
//  IndoorOutdoorPage.swift
//  Bored
//
//  Created by Nathan Park on 7/11/23.
//

import SwiftUI

struct IndoorOutdoorView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Handle outdoor button action
            }) {
                Text("Outdoor")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                // Handle indoor button action
            }) {
                Text("Indoor")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct IndoorOutdoor_Previews: PreviewProvider {
    static var previews: some View {
        IndoorOutdoorView()
    }
}

