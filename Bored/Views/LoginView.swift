//
//  LoginView.swift
//  Bored
//
//  Created by Timothy Park on 7/11/23.
//

import SwiftUI

struct LoginView: View {
    @State var emailID: String = ""
    @State var phoneID: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 10) {
            Text("Sign in")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("Welcome back")
                .font(.title3)
                .hAlign(.leading)
            VStack(spacing: 12) {
                TextField("Email", text: $emailID)
                    .textContentType(.emailAddress)
                    .border(1 , .orange.opacity(0.5))
                
                TextField("Phone Number", text: $emailID)
                    .textContentType(.emailAddress)
                    .border(1 , .orange.opacity(0.5))
                
                SecureField("Password", text: $password)
                    .textContentType(.emailAddress)
                    .border(1 , .orange.opacity(0.5))
                Button("Reset Password", action: {})
                    .font(.callout)
                    .fontWeight(.medium)
                    .tint(.black)
                    .hAlign(.trailing)
                
                Button {
                    
                } label: {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .hAlign(.center)
                        .fillView(.black)
                        
                }

            }
        }
        .vAlign(.top)
        .padding(15)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



extension View{
    func hAlign(_ alignment: Alignment) -> some View{
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    func vAlign(_ alignment: Alignment) -> some View{
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func border(_ width: CGFloat,_ color: Color) -> some View{
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
    
    func fillView(_ color: Color) -> some View{
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(color)
            }
    }
}



