//
//  Constants.swift
//  FashionApp
//
//  Created by THIS on 2/25/24.
//

import SwiftUI

var product1: Product = .init(title: "Kemishe beige", price: 59, description: "Pershkrim", images: ["P01_01","P01_02","P01_03"], category: .Tops, gender: .Male)

var product2: Product = .init(title: "Cante lekure", price: 45, description: "Pershkrim", images: ["P02_01","P02_02","P02_03"], category: .Accessories, gender: .Female)

var product3: Product = .init(title: "Fustan pranveror", price: 63, description: "Pershkrim", images: ["P03_01","P03_02","P03_03"], category: .Dresses, gender: .Female)

var product4: Product = .init(title: "Sako e gjere", price: 50, description: "Pershkrim", images: ["P04_01","P04_02","P04_03"], category: .Tops, gender: .UniSex)

var product5: Product = .init(title: "Kepuce lekure", price: 90, description: "Pershkrim", images: ["P05_01","P05_02","P05_03"], category: .Shoes, gender: .Male)

var product6: Product = .init(title: "Kapele SanDiego", price: 20, description: "Pershkrim", images: ["P06_01","P06_02","P06_03"], category: .Accessories, gender: .UniSex)

func tenorSans(_ size: CGFloat) -> Font{
    Font.custom("Tenor Sans", size: size)
}

let hashtags=["#2024","#summer","#collection","#spring","#dress","#skirt","#dierza"]
