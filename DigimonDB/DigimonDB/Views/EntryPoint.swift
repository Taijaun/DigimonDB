//
//  EntryPoint.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import SwiftUI

struct EntryPoint: View {
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            coordinator.getAppPage(page: .launchScreen)
                .navigationDestination(for: AppPages.self) { navigation in
                    coordinator.getAppPage(page: navigation)
                }
        }
    }
}

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint()
    }
}
