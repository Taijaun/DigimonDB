//
//  ContentView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    
    var fetchRequest: NSFetchRequest<DigimonEntity> = DigimonEntity.fetchRequest()
    @FetchRequest(entity: DigimonEntity.entity(), sortDescriptors: [])
    private var results: FetchedResults<DigimonEntity>

    var body: some View {
        VStack{
            Text("Hello")
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
