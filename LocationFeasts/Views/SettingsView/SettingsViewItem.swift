//
//  SettingsViewItem.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 20.02.2024.
//

import SwiftUI

struct SettingsViewItem: View {
    var title:LocalizedStringKey
    var iconName: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName).foregroundStyle(Color.averlandSunset)
            Text(title)
        }
    }
}

#Preview {
    SettingsViewItem(title: LocalKeys.SettingView.darkMode.rawValue.locale(), iconName: "moon.fill")
}
