//
//  DigimonDBApp.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

@main
struct DigimonDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EntryPoint()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(Coordinator())
        }
    }
}
