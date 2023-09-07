//
//  CardView.swift
//  HikingApp
//
//  Created by Ramiro Aguirre on 07/09/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [.customIndigoMedium, .customSalmonLight], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 256, height: 256)
                Image("image-1")
                    .resizable()
                .scaledToFit()
            }
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
