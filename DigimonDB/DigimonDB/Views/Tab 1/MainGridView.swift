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
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(fetchedDigimon, id: \.self){ digimon in
                        Button {
                            coordinator.goToDetailsScreen(digimon: digimon, color: digimon.color ?? "")
                        } label: {
                            CustomGridCell(digimon: digimon)
                        }

                    }
                }
            }
        }
        .navigationBarHidden(true)
        .background(Image("HexBackground"))
    }
}

struct MainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MainGridView(digimonViewModel: DigimonCardViewModel(manager: NetworkManager()))
    }
}
