//
//  CharacteristicItemView.swift
//  MySparTestCase
//
//  Created by Ruslan Magomedov on 30.01.2024.
//

import SwiftUI

struct CharacteristicItemView: View {
    let characteristicName: String
    let characteristicValue: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(characteristicName)
                .multilineTextAlignment(.leading)
            
            DotterSpacer()
            
            Text(characteristicValue)
                .multilineTextAlignment(.trailing)
        }
        .font(.footnote)
    }
}

#Preview {
    CharacteristicItemView(characteristicName: "Энергетическая ценность, ккал/100г", characteristicValue: "25ккал, 105 кДЖ")
}
