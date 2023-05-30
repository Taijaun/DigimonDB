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
    @State var color: Color?
    @EnvironmentObject var coordinator: Coordinator
    @State var cardBlur = 50.0

    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        VStack{
            Button {
                Task{
                    let coreDataManager = CoreDataManager(context: viewContext)
                    self.digimon = coreDataManager.loadRandomCard()
                    getShadowColour(digimonColor: self.digimon?.color ?? "")
                    
                }
            } label: {
                Text("Generate Random Card")
            }.buttonStyle(.borderedProminent)
            
            if digimon != nil {
                Button {
                    coordinator.goToDetailsScreen(digimon: digimon!, color: digimon?.color ?? "")
                } label: {
                    KFImage(URL(string: digimon?.image_url ?? Endpoints.defaultImage))
                        .cornerRadius(20.0)
                        .shadow(color: color ?? .clear ,radius: 10.0)
                        .blur(radius: cardBlur)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration:2).speed(2)){
                                cardBlur = 0.0
                            }
                        }
                }

                
            } else {
                KFImage(URL(string: Endpoints.defaultImage))
            }

        }.background(
            Image("HexBackground")
                .offset(x: -50, y: -80)
        )
    }
    func getShadowColour(digimonColor: String){
        switch digimonColor{
        case "Yellow":
            self.color = .yellow
        case "Red":
            self.color = .red
        case "Green":
            self.color = .green
        case "Black":
            self.color = .black
        case "Purple":
            self.color = .purple
        case "Colorless":
            self.color = .clear
        case "Blue":
            self.color = .blue
        default:
            self.color = .clear
        }
    }
}

struct RandomCardView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCardView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext), digimon: DigimonEntity(context: PersistenceController.shared.container.viewContext))
    }
}
