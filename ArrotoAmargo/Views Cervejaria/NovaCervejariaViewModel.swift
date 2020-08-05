//
//  NovaCervejariaViewModel.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 04/08/20.
//

import Combine

class NovaCervejariaViewModel: ObservableObject {
    @Published var estados: [String] = []
    
    init() {
        for estado in UF.allCases {
            estados.append(estado.rawValue)
        }
    }
}
