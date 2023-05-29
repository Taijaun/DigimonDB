//
//  CustomGridCell.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher

struct CustomGridCell: View {
    var digimon: DigimonEntity
    
    var body: some View {
        VStack{
            KFImage(URL(string: digimon.image_url ?? Endpoints.defaultImage))
                .resizable()
                .frame(width: 150, height: 200)
                .cornerRadius(20.0)
        }
    }
}

//struct CustomGridCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomGridCell(digimon: Digimon())
//    }
//}
