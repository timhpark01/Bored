//
//  HomePage.swift
//  Bored
//
//  Created by Timothy Park on 7/7/23.
//

import SwiftUI

struct LandingPageView: View {
    @State private var isShowingDestinationView = false

//    @StateObject private var navigationStack = NavigationStack(NavigationItem(LandingPageView()))
    
    var body: some View {
        VStack {
            Text("Bored?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
//            Image(systemName: "circle")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 200, height: 200)
//                .padding()
            BoredCircleComponent(width: 200, height: 200)
            
            Text("Find Something to Do!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                isShowingDestinationView = true
            }) {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .sheet(isPresented: $isShowingDestinationView) {
                HomePageView()
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.headline)
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
            }
            .padding(.top)
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

