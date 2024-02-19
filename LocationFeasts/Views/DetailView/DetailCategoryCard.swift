//
//  DetailCategoryCard.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 19.02.2024.
//

import SwiftUI

struct DetailCategoryCard: View {
    var title : String
    var body: some View {
        Text(title)
            .foregroundStyle(Color.scareubusSacer)
            .modifier(DisplayMediumBold())
            .padding(.all,ProjectPaddings.small.rawValue)
            .background(Color.averlandSunset)
            .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
    }
}

#Preview {
    DetailCategoryCard(title: "kebap")
}
