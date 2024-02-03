//
//  SettingsView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 19.10.2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewViewModel()
    @Binding var showMainAuthView: Bool

    @Environment(\.colorScheme) var colorScheme
    @State var ison2: Bool = false
    @State var selectedItem :String = " "
    var body: some View {
        NavigationStack{
                VStack{
                    Spacer()
                    List{
                        Section(LocalKeys.Settings.interface.rawValue.locale()){
                          
                            Toggle(isOn: $viewModel.darkModeToggle) {
                                SettingsViewItem(title: LocalKeys.Settings.darkMode.rawValue.locale(), iconName: "moon.fill")
                            }.preferredColorScheme(viewModel.darkModeToggle ? .dark : .light)
                            
                            Toggle(isOn: $ison2){
                                SettingsViewItem(title: LocalKeys.Settings.notifications.rawValue.locale(), iconName: "bell.fill")
                            }
                        }
                        Section(LocalKeys.Settings.appSettings.rawValue.locale()){
                            NavigationLink{
                                HomeView()
                            }label: {
                                SettingsViewItem(title: LocalKeys.Settings.categories.rawValue.locale(), iconName: "list.bullet.rectangle.fill")
                            }
                            NavigationLink{
                                HomeView()
                            }label: {
                                SettingsViewItem(title: LocalKeys.Settings.currencyUnit.rawValue.locale(), iconName: "rhombus.fill")
                            }
                        }
                        
                        Section(LocalKeys.Settings.account.rawValue.locale()){
                            
                                NavigationLink{
                                    UpdateEmailView()
                                }label: {
                                    SettingsViewItem(title: LocalKeys.Settings.updateEmail.rawValue.locale(), iconName: "envelope.fill")
                                    
                                }
                                
                            
                            
                            NavigationLink{
                                UpdateEmailView()
                            }label: {
                               
                                    SettingsViewItem(title: LocalKeys.Settings.updatePassword.rawValue.locale(), iconName: "lock.fill")
                                   
                                
                            }
                            
                            
                                SettingsViewItem(title: LocalKeys.Settings.signOut.rawValue.locale(), iconName: "person.fill.badge.minus").onTapGesture {
                                    Task{
                                        do{
                                            try await viewModel.signOut()
                                            showMainAuthView  = true
                                        }catch{
                                            print(error)
                                        }
                                    }
                                }
                            }
                            

                        }
                    }
                    Spacer()
                }
                .navigationTitle(LocalKeys.Settings.settings.rawValue.locale()).navigationBarTitleDisplayMode(.inline)
                
                
        }
    }



#Preview {
    SettingsView(showMainAuthView: .constant(false)).ignoresSafeArea()
}
