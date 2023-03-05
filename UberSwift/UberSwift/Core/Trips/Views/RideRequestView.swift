//
//  RideRequestView.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 5.03.2023.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRide: RideType = .uberX
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 2, height: 18)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                }
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Current Location")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Text("02:55 PM")
                            .padding(.leading)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                            .bold()
                    }
                    HStack {
                        
                        Text("Coffee Lovers")
                            .padding(.trailing)
                            .font(.callout)
                            .bold()
                        Spacer()
                        
                        Text("02:55 PM")
                            .font(.footnote)
                            .padding(.leading)
                            .foregroundColor(.secondary)
                            .bold()
                        
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack() {
                Text("SUGGESTED RIDES")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(RideType.allCases) { ride in
                            VStack(alignment: .leading) {
                                Image(ride.ImageName)
                                    .resizable()
                                    .scaledToFit()
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(ride.description)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    
                                    Text("250.00₺")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                }
                                .padding(8)
                            }
                            .frame(width: 112, height: 140)
                            .foregroundColor(ride == selectedRide ? .white : .black)
                            .background(Color(ride == selectedRide ? .systemBlue : .systemGroupedBackground))
                            .scaleEffect(ride == selectedRide ? 1.1 : 1.0)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedRide = ride
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(.blue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                        .padding(.leading)
                    
                    Text("**** 1234")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                }
                .frame(height: 50)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top)
                
                Button {
                    //
                } label: {
                    Text("Confirm Ride")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }

            }
            .background(.white)
            .cornerRadius(24)
        }
        .padding(.bottom)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
