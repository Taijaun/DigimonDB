//
//  CustomTabView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView{
            MainGridView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            UserSelectView()
                .tabItem {
                    Label("Custom", systemImage: "person.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
