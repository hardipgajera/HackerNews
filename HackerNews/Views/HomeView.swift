//
//  HomeView.swift
//  HackerNews
//
//  Created by hardip gajera on 03/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModal = HomeViewModal()
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello, world!")
                    .padding()
            }
            .navigationBarTitle("HackerNews")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
