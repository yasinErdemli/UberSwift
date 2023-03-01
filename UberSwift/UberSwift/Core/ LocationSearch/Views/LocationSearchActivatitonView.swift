//
//  LocationSearchActivatitonView.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct LocationSearchActivatitonView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8, alignment: .center)
                .padding(.horizontal)
            Text("Where To?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 64, maxHeight: 50)
        .background {
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        }
    }
}

struct LocationSearchActivatitonView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivatitonView()
            .previewLayout(.sizeThatFits)
    }
}
