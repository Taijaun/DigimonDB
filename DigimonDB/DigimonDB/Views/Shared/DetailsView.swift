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
    
    var body: some View {
        VStack{
            ZStack {
                Color(UIColor(color ?? .clear))
                //Color(UIColor(named: digimon.color ?? "white") ?? .lightGray)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    // Image
                    KFImage(URL(string: digimon.image_url ?? Endpoints.defaultImage))
                        .resizable()
                        .frame(width: 375.0, height: 415.0)
                        .cornerRadius(20.0)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
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
                }
            }.onAppear(){
                getShadowColour(digimonColor: digimon.color ?? "")
            }
        }
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
        DetailsView(digimon: DigimonEntity(context: PersistenceController.shared.container.viewContext))
    }
}
