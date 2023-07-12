//
//  HomePage.swift
//  Bored
//
//  Created by Timothy Park on 7/7/23.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var username: String
    var content: String
}

struct HomePageView: View {
    var posts: [Post] = [
        Post(username: "John", content: "Having a great day!"),
        Post(username: "Emily", content: "Just finished an amazing book."),
        Post(username: "David", content: "Excited for my upcoming trip!")
    ]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading, spacing: 8) {
                    Text(post.username)
                        .font(
//                            .headline
                            .custom("Helvetica Neue", size: 30)
                        )
                    Text(post.content)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding(8)
            }
            .navigationTitle("Home")
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

