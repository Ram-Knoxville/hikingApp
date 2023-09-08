//
//  SettingsView.swift
//  HikingApp
//
//  Created by Ramiro Aguirre on 07/09/23.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: PROPERTIES
    
    private let alternateAppIcons:[String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                                .customGreenMedium,
                                .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack (spacing: 8){
                    Text("Where you can find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike looks gorgeous in photos but is even better once you are actually there. the hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots ! it's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                } //: VSTACK
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            } //: HEADER
            .listRowSeparator(.hidden)
            
            
            // MARK: - SECTION: ICONS
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                         
                            Button{
                                UIApplication.shared.setAlternateIconName(alternateAppIcons [item]) { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                     print("Success")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                            
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION: ABOUT
            
            Section(
                header: Text("About the App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All rights reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic label content
//                LabeledContent("Application", value: "Hike")
                // 2. Advanced labeled content
                CustomListRowview(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowview(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                CustomListRowview(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowview(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowview(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ramiro Aguirre", rowTintColor: .mint)
                CustomListRowview(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                CustomListRowview(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "TeamPocketSoftware", rowLinkDestination: "http://carteldesanta.com")
            }
        } //: List
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
