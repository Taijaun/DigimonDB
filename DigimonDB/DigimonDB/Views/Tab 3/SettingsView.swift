//
//  SettingsView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct SettingsView: View {
    
    var coreDataManager: CoreDataOperationalProtocol
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        VStack{
            Group{
                Button {
                    Task{
                        await CoreDataManager(context: viewContext).deleteTable()
                    }
                } label: {
                    Text("Reset all Favourites")
                }
                
                Button {
                    //
                } label: {
                    Text("Redownload all Cards")
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
    }
}
