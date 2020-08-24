//
//  TableView.swift
//  TestSwiftUI
//
//  Created by Michael Dean Villanda on 8/24/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

struct TableView: View {
    let allFruits: [Fruit] = [
        .init(id: 0, name: "Apples", description: "The apple is a pome (fleshy) fruit, in which the ripened ovary and surrounding tissue both become fleshy and edible. ... When harvested, apples are usually roundish, 5–10 cm (2–4 inches) in diameter, and some shade of red, green, or yellow in colour; they vary in size, shape, and acidity depending on the variety.", imagePath: "apples"),
        .init(id: 1, name: "Oranges", description: "Oranges are round orange-coloured fruit that grow on a tree which can reach 10 metres (33 ft) high. Orange trees have dark green shiny leaves and small white flowers with five petals. The flowers smell very sweet which attracts many bees. An orange has a tough shiny orange skin.", imagePath: "oranges"),
        .init(id: 2, name: "Banana", description: "A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called \"plantains\", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.", imagePath: "bananas")]
    
    var body: some View {
        List(allFruits) { fruit in
            TableRow(fruit: fruit)
        }.navigationBarTitle("Fruits")
    }
}

struct TableRow: View {
    var fruit: Fruit
    
    var body: some View {
        HStack(alignment: .top) {
            Image(fruit.imagePath)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8.0) {
                Text(fruit.name).font(.headline)
                Text(fruit.description).font(.subheadline).lineLimit(nil)
            }.padding(.leading, 8.0)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
