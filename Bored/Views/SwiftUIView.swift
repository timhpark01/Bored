//
//  SwiftUIView.swift
//  Bored
//
//  Created by Timothy Park on 7/7/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(){
            HStack(){
                Color.red
            }
//            .layoutPriority()
            HStack() {
                HStack() {
                    Image(systemName: "house.fill")

                }
                HStack() {
                    Image(systemName: "star")
                }
                HStack() {
                    Image(systemName: "plus")
                }
                HStack() {
                    Image(systemName: "magnifyingglass")
                }
                HStack() {
                    Image(systemName: "bag")
                }
            }
            .background(Color.orange)

        }
        .ignoresSafeArea()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
