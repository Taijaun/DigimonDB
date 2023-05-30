//
//  CustomTabView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct CustomTabView: View {
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        TabView{
            MainGridView(digimonViewModel: DigimonCardViewModel(manager: NetworkManager(), coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext)))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            UserSelectView()
                .tabItem {
                    Label("Custom", systemImage: "person.fill")
                }
            SettingsView(coreDataManager: CoreDataManager(context: viewContext), digimonCardViewModel: DigimonCardViewModel(manager: NetworkManager(), coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext)))
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
