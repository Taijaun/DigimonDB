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
                    Text("Reset all Data")
                }
                
                Button {
                    //
                } label: {
                    Text("Redownload all Cards")
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .padding()
        }.background(
            ZStack{
                Image("HexBackground")
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
    }
}
