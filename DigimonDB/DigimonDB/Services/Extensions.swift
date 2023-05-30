//
//  Extensions.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

class ReloadViewHelper: ObservableObject{
    func reloadView(){
        objectWillChange.send()
    }
}

enum ViewStates{
    case loaded
    case error
    case loading
}
