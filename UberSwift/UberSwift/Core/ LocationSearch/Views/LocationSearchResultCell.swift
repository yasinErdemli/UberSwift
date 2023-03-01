//
//  LocationSearchResultCell.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var title: String
    var subtitle: String
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(Color.blue)
                .tint(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "Lorem ipsum", subtitle: "Lorem ipsum dolor sit amet")
    }
}
