//
//  Route.swift
//  HomeQuest
//
//  Created by Muktar Aisak on 15/07/2024.
//

import Foundation
import SwiftUI

enum Route {
    static let routes: [NavigationPaths: AnyView] = [
        .login: AnyView(LoginView()),
        .maintab: AnyView(Maintab())
    ]
}


enum NavigationPaths: CaseIterable {
    case login
    case maintab
}
