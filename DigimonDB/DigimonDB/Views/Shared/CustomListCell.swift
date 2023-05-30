//
//  CustomListCell.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher

struct CustomListCell: View {
    var digimon: DigimonEntity
    @State var color: Color?
    
    var body: some View {
        
        
        
        VStack{
            KFImage(URL(string: digimon.image_url ?? Endpoints.defaultImage))
                .resizable()
                .frame(width: 150, height: 200)
                .cornerRadius(20.0)
                .shadow(radius: 10.0)
                .shadow(color: color ?? .black, radius: 10.0)
                
        }.onAppear(){
            getShadowColour(digimonColor: digimon.color ?? "")
            
        }
    }
    
    // Convert the color attribute of digimon into color
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

struct CustomListCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCell(digimon: DigimonEntity(context: PersistenceController.shared.container.viewContext))
    }
}
