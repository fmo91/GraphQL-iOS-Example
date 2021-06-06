//
//  ContentView.swift
//  TodoListGraphQL
//
//  Created by Fernando Ortiz - Parser on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ProjectsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
