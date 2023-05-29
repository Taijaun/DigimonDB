//
//  RandomCardView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher
import CoreData

struct RandomCardView: View {
    
    var coreDataManager: CoreDataManager?
    @State var digimon: DigimonEntity?

    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        VStack{
            Button {
                Task{
                    let coreDataManager = CoreDataManager(context: viewContext)
                    self.digimon = coreDataManager.loadRandomCard()
                }
            } label: {
                Text("Generate Random Card")
            }
            
            if digimon != nil {
                KFImage(URL(string: digimon?.image_url ?? Endpoints.defaultImage))
            } else {
                KFImage(URL(string: Endpoints.defaultImage))
            }

        }
    }
}

struct RandomCardView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCardView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext), digimon: DigimonEntity(context: PersistenceController.shared.container.viewContext))
    }
}
