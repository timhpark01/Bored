//
//  ProfilePage.swift
//  Bored
//
//  Created by Timothy Park on 7/7/23.
//

import SwiftUI

struct Users {
    var username: String
    var bio: String
    var followers: Int
    var following: Int
    var posts: Int
}

struct ProfilePageView: View {
    var user: Users
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("profile_picture")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text(user.username)
                .font(.title)
                .fontWeight(.bold)
            
            Text(user.bio)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(nil)
            
            HStack(spacing: 16) {
                VStack {
                    Text("\(user.posts)")
                        .font(.headline)
                    Text("Posts")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(user.followers)")
                        .font(.headline)
                    Text("Followers")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("\(user.following)")
                        .font(.headline)
                    Text("Following")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        let users = Users(username: "JohnDoe", bio: "I love photography and traveling.", followers: 1500, following: 120, posts: 250)
        ProfilePageView(user: users)
    }
}

