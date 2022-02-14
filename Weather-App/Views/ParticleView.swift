//
//  ParticleView.swift
//  Weather-App
//
//  Created by Elliot Joseph on 08/02/2022.
//

import SwiftUI
import SpriteKit
struct ParticleView: View {
    @Binding var id: Int
    var body: some View {
        switch  id {
            case 500...531:
                SpriteView(scene: SpriteManager.rainEffect, options: [.allowsTransparency])
            case 600...632:
                SpriteView(scene: SpriteManager.snowEffect, options: [.allowsTransparency])
            default:
                EmptyView()
        }
    }
}

//struct ParticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParticleView()
//    }
//}
