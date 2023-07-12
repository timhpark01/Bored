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
    @State private var indoorOutdoor = false
    @State private var action: Int? = 0
    var posts: [Post] = [
        Post(username: "John", content: "Having a great day!"),
        Post(username: "Emily", content: "Just finished an amazing book."),
        Post(username: "David", content: "Excited for my upcoming trip!")
    ]
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                VStack(alignment: .leading, spacing: 8) {
                    Text(post.username)
                        .font(.custom("Helvetica Neue", size: 30))
                    Text(post.content)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding(8)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    Button(action:{print("Button tapped!")}){
                        NavigationLink(destination: IndoorOutdoorView()) {
                            ResizableLogoImage(width: 150, height: 150, text: "Bored?")
                            .padding(.bottom, 75)
                        }
                    }
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
