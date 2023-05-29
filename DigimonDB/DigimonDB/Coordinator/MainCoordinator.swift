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
    
    @Published var navigationPath = NavigationPath()
    
    func goToMainScreen(){
        navigationPath.append(AppPages.mainGrid)
    }
    
    func goToUserSelectionScreen(){
        navigationPath.append(AppPages.userSelection)
    }
    
    func goToFacouritedScreen(){
        navigationPath.append(AppPages.favouritedCards)
    }
    
    func goToRandomCardsScreen(){
        navigationPath.append(AppPages.randomCards)
    }
    
    func goToSettingsScreen(){
        navigationPath.append(AppPages.settings)
    }
    
    @ViewBuilder
    func getAppPage(page: AppPages) -> some View {
        
        switch page {
        case .mainGrid:
            MainGridView()
        case .userSelection:
            MainGridView()
        case .favouritedCards:
            FavouritedCardsView()
        case .randomCards:
            RandomCardView()
        case .settings:
            SettingsView()
        case .tabView:
            CustomTabView()
            
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
}
