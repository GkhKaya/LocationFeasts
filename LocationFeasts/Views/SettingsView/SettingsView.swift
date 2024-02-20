//
//  SettingsView.swift
//  LocationFeasts
//
//  Created by Gokhan Kaya on 20.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = SettingsViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                List{
                    Section(LocalKeys.SettingView.interface.rawValue.locale()){
                        Toggle(isOn: $viewModel.darkModeToggle) {
                            SettingsViewItem(title: LocalKeys.SettingView.darkMode.rawValue.locale(), iconName: "moon.fill")
                        }.preferredColorScheme(viewModel.darkModeToggle ? .dark : .light)
                        
                        Toggle(isOn: $viewModel.isOn2){
                            SettingsViewItem(title: LocalKeys.SettingView.notifications.rawValue.locale(), iconName: "bell.fill")
                        }
                        
                        Toggle(isOn: $viewModel.isEnglish){
                            if viewModel.isEnglish == true{
                                SettingsViewItem(title: LocalKeys.SettingView.english.rawValue.locale(), iconName: "text.word.spacing")
                            }else{
                                SettingsViewItem(title: LocalKeys.SettingView.turkish.rawValue.locale(), iconName: "text.word.spacing")
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }
}

    
    #Preview {
        SettingsView()
    }
