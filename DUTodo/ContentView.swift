//
//  ContentView.swift
//  DUTodo
//
//  Created by 이동욱 on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TaskListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
