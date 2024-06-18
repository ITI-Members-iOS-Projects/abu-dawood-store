//
//  UserDefaultsProtocol.swift
//  Abu Dawood
//
//  Created by MESHO on 03/06/2024.
//

import Foundation

protocol UserDefaultProtocol{
    func checkingShowingOnboarding()->Bool
    func sawOnboarding()
    func presentOnboarding()
    
    func isLoggedIn()->Bool
    func login()
    func logut()
}
