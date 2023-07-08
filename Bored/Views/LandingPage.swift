//
//  HomePage.swift
//  Bored
//
//  Created by Timothy Park on 7/7/23.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        VStack {
            Text("Welcome to My Social Media App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image("social_media_icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Connect with friends and share your experiences.")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.headline)
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.blue)
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

