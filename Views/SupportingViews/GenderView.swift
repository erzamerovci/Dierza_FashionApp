//
//  GenderView.swift
//  FashionApp
//
//  Created by THIS on 2/27/24.
//

import SwiftUI

struct GenderView: View {
    var isSelected: Bool=true
    var title: String = "FEMRA"
    
    var body: some View {
        VStack(spacing:1){
            Text(title)
                .font(tenorSans(16))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.Default : Color.Placeholder.opacity(0.5))
            
            if isSelected{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(height: 1)
                    
                    Rectangle()
                        .foregroundColor(Color.Default)
                        .frame(width:5, height: 5)
                        .rotationEffect(Angle(degrees:45))
                }
            }else{
                Divider()
            }
        }
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView()
    }
}
