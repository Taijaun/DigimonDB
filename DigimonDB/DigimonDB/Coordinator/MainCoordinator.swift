//
//  MainCoordinator.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation
import SwiftUI

@MainActor
class Coordinator: ObservableObject {
    @Environment(\.managedObjectContext) var viewContext
    
    @Published var navigationPath = NavigationPath()
    var digimon: DigimonEntity?
    var digimonCardColor: String?
    
    func goToMainScreen(){
        navigationPath.append(AppPages.mainGrid)
    }
    
    func goToUserSelectionScreen(){
        navigationPath.append(AppPages.userSelection)
    }
    
    func goToFavouritedScreen(){
        navigationPath.append(AppPages.favouritedCards)
    }
    
    func goToRandomCardsScreen(){
        navigationPath.append(AppPages.randomCards)
    }
    
    func goToSettingsScreen(){
        navigationPath.append(AppPages.settings)
    }
    
    func goToDetailsScreen(digimon: DigimonEntity, color: String){
        self.digimon = digimon
        self.digimonCardColor = color
        navigationPath.append(AppPages.details)
    }
    
    func goToTabView(){
        navigationPath.append(AppPages.tabView)
    }
    
    @ViewBuilder
    func getAppPage(page: AppPages) -> some View {
        
        switch page {
        case .mainGrid:
            MainGridView(digimonViewModel: DigimonCardViewModel(manager: NetworkManager()))
        case .userSelection:
            UserSelectView()
        case .favouritedCards:
            FavouritedCardsView(coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
        case .randomCards:
            RandomCardView()
        case .settings:
            SettingsView(coreDataManager: CoreDataManager(context: viewContext))
        case .tabView:
            CustomTabView()
        case .details:
            DetailsView(digimon: self.digimon!, coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
        case .launchScreen:
            StartScreen(digimonViewModel: DigimonCardViewModel(manager: NetworkManager()), coreDataManager: CoreDataManager(context: PersistenceController.shared.container.viewContext))
            
        default:
            EmptyView()
        }
    }
    
    
}


enum AppPages{
    case tabView
    case mainGrid
    case userSelection
    case favouritedCards
    case randomCards
    case settings
    case details
    case launchScreen
}
