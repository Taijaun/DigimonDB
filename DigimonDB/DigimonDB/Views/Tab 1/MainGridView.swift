//
//  MainGridView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher
import CoreData

struct MainGridView: View {
    
    
    @StateObject var digimonViewModel: DigimonCardViewModel
    @State var errorOccured = false
    let columns = [GridItem(), GridItem()]
    @EnvironmentObject var coordinator: Coordinator
    
    
    @Environment(\.managedObjectContext) var viewContext
    var fetchRequest: NSFetchRequest<DigimonEntity> = DigimonEntity.fetchRequest()
    @FetchRequest(entity: DigimonEntity.entity(), sortDescriptors: [])
    var fetchedDigimon: FetchedResults<DigimonEntity>
    
    var body: some View {

        VStack{

            ScrollView(.vertical){
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(fetchedDigimon, id: \.self){ digimon in
                        Button {
                            coordinator.goToDetailsScreen(digimon: digimon)
                        } label: {
                            CustomGridCell(digimon: digimon)
                        }

                    }
                }
            }
        }.task {
            await digimonViewModel.getDigimonList(urlString: Endpoints.DigimonCardEndpoint, coreDataManager: CoreDataManager(context: viewContext))
            
            // Print the db file path
            guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {return}
            
            let sqlitePath = url.appendingPathComponent("DigimonDB")
            print(sqlitePath)

        }
    }
}

struct MainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MainGridView(digimonViewModel: DigimonCardViewModel(manager: NetworkManager()))
    }
}
