//
//  HomeScreenView.swift
//  Bored
//
//  Created by Timothy Park on 7/6/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("B")
                        .font(.system(size:90))
                        .padding()
                        .frame(width:100)
                }
                
                HStack {
                    Text("O")
                        .font(.system(size:90))
                        .padding()
                        .frame(width:100)
                }
                HStack {
                    Text("R")
                        .font(.system(size:90))
                        .padding()
                        .frame(width:100)
                }
                HStack {
                    Text("E")
                        .font(.system(size:90))
                        .padding()
                        .frame(width:100)
                }
                HStack {
                    Text("D")
                        .font(.system(size:90))
                        .padding()
                        .frame(width:100)
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
