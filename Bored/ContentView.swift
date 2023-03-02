//
//  ContentView.swift
//  Bored
//
//  Created by Timothy Park on 2/28/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//    )
    
    var body: some View {
//            Map(coordinateRegion: $region)
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
        VStack{
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            //comment
            
            circleimage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading){
                Text("Bored")
                    .font(.title)
                    .foregroundColor(Color.orange)
                    .padding(0.0)
                HStack {
                    Text("For all you bored people")
                        .font(.subheadline)
                    Spacer()
                    Text("Princeton")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.blue)
                
                
                Divider()
                Text("About the app")
                    .font(.title2)
                Text("Descriptions of the app goes here")
            }
            .padding()
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
