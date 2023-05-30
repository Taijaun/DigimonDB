//
//  UserSelectView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher

struct UserSelectView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
            VStack{
                Image("DigimonLogo2")
                    .resizable()
                    .frame(width: 250, height: 230)
                Group{
                    Button {
                        coordinator.goToFavouritedScreen()
                    } label: {
                        ZStack{
                            Image("Digivice2")
                                .resizable()
                                .frame(width:300, height: 200)
                            Text("Favourite Cards")
                                .offset(x: -30, y: -15)
                                .font(.headline)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray)
                    .foregroundColor(.white)
                    
                    Button {
                        coordinator.goToRandomCardsScreen()
                    } label: {
                        ZStack{
                            Image("Digivice1")
                                .resizable()
                                .frame(width: 300, height: 200)
                            Text("Random Cards")
                                .offset(x: -30, y: -15)
                                .font(.headline)
                                
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                }.padding()
            }.background(
                Image("HexBackground")
                    .aspectRatio(contentMode: .fit)
            )
    }
}

struct UserSelectView_Previews: PreviewProvider {
    static var previews: some View {
        UserSelectView()
    }
}
