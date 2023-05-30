//
//  FavouritedCardsView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct FavouritedCardsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    var coreDataManager: CoreDataOperationalProtocol
    @State var results = [DigimonEntity]()
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            List(results, id: \.self){ digimon in
                Button {
                    coordinator.goToDetailsScreen(digimon: digimon, color: digimon.color ?? "")
                } label: {
                    CustomListCell(digimon: digimon)
                }

                
            }
        }.task {
            results = await coreDataManager.fetchFavourites()
        }
    }
}

//struct FavouritedCardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritedCardsView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
//    }
//}
