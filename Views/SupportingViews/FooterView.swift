//
//  FooterView.swift
//  FashionApp
//
//  Created by THIS on 2/27/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack{
            Image("Dierza")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("Footer")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
