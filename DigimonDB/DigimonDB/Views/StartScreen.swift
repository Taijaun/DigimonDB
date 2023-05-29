//
//  StartScreen.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct StartScreen: View {
    
    @State private var easeInOut = false
    @State var showLogo = false
    @EnvironmentObject var coordinator: Coordinator
    @State var logoBlur = 50.0
    @State var startOpacity = 0.0
    @Environment(\.managedObjectContext) var viewContext
    @StateObject var digimonViewModel: DigimonCardViewModel
    
    var body: some View {
        VStack{
            Image("DigimonLogo")
                .resizable()
                .frame(width: 390.0, height: 150.0)
                .padding(.bottom, 170)
                .shadow(radius: 95)
                .blur(radius: logoBlur)
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration:2).speed(2)){
                        logoBlur = 0.0
                    }
                }
            
            
            Button {
                coordinator.goToTabView()
            } label: {
                Text("Tap to Start")
                    .font(.title)
                    .opacity(startOpacity)
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever().speed(1)){
                            startOpacity = 1
                        }
                    }
                //
                //            Text("Tap to Start")
                //                .font(.title)
                //                .onAppear(){
                //                    withAnimation(Animation.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) {
                //                        easeInOut.toggle()
                //                    }
                //                }.opacity(easeInOut ? 0 : 1)
            }
            
        }.task {
            await digimonViewModel.getDigimonList(urlString: Endpoints.DigimonCardEndpoint, coreDataManager: CoreDataManager(context: viewContext))
            
            // Print the db file path
            guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {return}
            
            let sqlitePath = url.appendingPathComponent("DigimonDB")
            print(sqlitePath)

        }
        
        
        
    }
    
    struct StartScreen_Previews: PreviewProvider {
        static var previews: some View {
            StartScreen(digimonViewModel: DigimonCardViewModel(manager: NetworkManager()))
        }
    }
}
