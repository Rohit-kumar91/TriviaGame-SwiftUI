//
//  Extension.swift
//  TriviaGameDemo
//
//  Created by Rohit Prajapati on 25/12/21.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
