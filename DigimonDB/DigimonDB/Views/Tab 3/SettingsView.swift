//
//  SettingsView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct SettingsView: View {
    
    var coreDataManager: CoreDataOperationalProtocol
    var digimonCardViewModel: DigimonCardViewModel
    @Environment(\.managedObjectContext) var viewContext
    @State private var showAllDataAlert = false
    
    var body: some View {
        VStack{
            Group{
                Button {
                    
//                    Task{
//                        await CoreDataManager(context: viewContext).deleteTable()
//                    }
                    showAllDataAlert.toggle()
                } label: {
                    Text("Reset all Data")
                }
                .alert("Warning, This will delete all DigimonDB Data", isPresented: $showAllDataAlert){
                    Button("Delete Data", role: .destructive){
                        Task{
                            await digimonCardViewModel.coreDataManager.deleteTable()
                        }
                    }
                    Button("Cancel", role: .cancel){
                        
                    }
                }
                
                Button {
                    Task{
                        await digimonCardViewModel.getDigimonList(urlString: Endpoints.DigimonCardEndpoint, coreDataManager: coreDataManager)
                    }
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
        SettingsView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext), digimonCardViewModel: DigimonCardViewModel(manager: NetworkManager(), coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext)))
    }
}
