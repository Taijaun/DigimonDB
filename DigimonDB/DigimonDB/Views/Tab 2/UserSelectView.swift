//
//  UserSelectView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct UserSelectView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
        VStack{
            Group{
                Button {
                    coordinator.goToFavouritedScreen()
                } label: {
                    Text("Favourite Cards")
                }
                
                Button {
                    coordinator.goToRandomCardsScreen()
                } label: {
                    Text("Random Cards")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct UserSelectView_Previews: PreviewProvider {
    static var previews: some View {
        UserSelectView()
    }
}
