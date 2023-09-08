//
//  CustomListRowview.swift
//  HikingApp
//
//  Created by Ramiro Aguirre on 07/09/23.
//

import SwiftUI

struct CustomListRowview: View {
    
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let content = rowContent  {
                Text(content)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if let linkLabel = rowLinkLabel, let linkDestination = rowLinkDestination {
                Link(linkLabel, destination: URL(string: linkDestination)!)
                    .fontWeight(.heavy)
            }else {
                EmptyView()
            }
            
        }label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowview_Previews: PreviewProvider {
    static var previews: some View {
        List{
            CustomListRowview(
                rowLabel: "Designer",
                rowIcon: "paintPallette",
                rowContent: "John Doe",
                rowTintColor: .pink
            )
        }
    }
}
