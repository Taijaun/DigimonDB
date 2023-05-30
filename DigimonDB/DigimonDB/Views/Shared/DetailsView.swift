//
//  DetailsView.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    var digimon: DigimonEntity
    @State var color: Color?
    @State private var webViewPresented = false
    var coreDataManager: CoreDataOperationalProtocol
    @StateObject var reloadHelper = ReloadViewHelper()
    @State var cardBlur = 50.0
    
    var body: some View {
        VStack{
            ZStack {
                Color(UIColor(color ?? .clear))
                //Color(UIColor(named: digimon.color ?? "white") ?? .lightGray)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                VStack{
                    // Image
                    KFImage(URL(string: digimon.image_url ?? Endpoints.defaultImage))
                        .resizable()
                        .frame(width: 375.0, height: 415.0)
                        .cornerRadius(20.0)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                        .shadow(color: color ?? .clear, radius: 10)
                    
                    // Name + effect
                    VStack(alignment: .leading){
                        Text(digimon.name ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        VStack{
                            HStack{
                                Text("Main effect")
                                    .font(.subheadline)
                                Spacer()
                                if self.digimon.isfavourited != true{
                                    Button {
                                        Task{ coreDataManager.toggleFavourite(digimon: digimon)
                                            reloadHelper.reloadView()
                                        }
                                    } label: {
                                        Image(systemName: "star")
                                    }

                                } else {
                                    Button {
                                        Task{ coreDataManager.toggleFavourite(digimon: digimon)
                                            reloadHelper.reloadView()
                                        }
                                    } label: {
                                        Image(systemName: "star.fill")
                                    }

                                }
                                }
                            .padding(.bottom, 10)

                            }
                            
                            HStack{
                                Text(digimon.maineffect ?? "Unknown")
                            }
                            
                            HStack{
                                // Stack for Digitype
                                VStack{
                                    HStack{
                                        VStack{
                                            Text("DigiType:")
                                            Text(digimon.digi_type ?? "Unknown")
                                        }
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(color ?? .clear, lineWidth: 4)
                                            )
                                        
                                        Spacer()
                                        VStack{
                                            Text("Attribute:")
                                            Text(digimon.attribute ?? "Unknown")
                                        }
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(color ?? .clear, lineWidth: 4)
                                            )
                                    }
                                    
                                    Button {
                                        webViewPresented = true
                                    } label: {
                                        Text("Read more")
                                    }

                                    
                                }
                                // Stack for attribute
                                
                                
                                Spacer()
                            }
                            .padding(.top)
                            
                        }
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40.0)
                    .shadow(color: .black, radius: 5.0)
                }
            }.onAppear(){
                getShadowColour(digimonColor: digimon.color ?? "")
            }.sheet(isPresented: $webViewPresented) {
                WebView(url: URL(string: Endpoints.digimonWiki+(digimon.cardnumber!))!)
            }.background(
            Image("HexBackground")
                .offset(x:-10, y:-30)
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(digimon: DigimonEntity(context: PersistenceController.shared.container.viewContext), coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
    }
}
