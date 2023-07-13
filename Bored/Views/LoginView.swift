//
//  LoginView.swift
//  Bored
//
//  Created by Timothy Park on 7/11/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct LoginView: View {
    @State var emailID: String = ""
    @State var phoneID: String = ""
    @State var password: String = ""
    
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
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
                
                TextField("Phone Number", text: $phoneID)
                    .textContentType(.telephoneNumber)
                    .border(1 , .orange.opacity(0.5))
                
                SecureField("Password", text: $password)
                    .textContentType(.emailAddress)
                    .border(1 , .orange.opacity(0.5))
                Button("Reset Password", action: resetPassword)
                    .font(.callout)
                    .fontWeight(.medium)
                    .tint(.black)
                    .hAlign(.trailing)
                
                Button(action: loginUser){
                    Text("Sign in")
                        .foregroundColor(.white)
                        .hAlign(.center)
                        .fillView(.black)
                        
                }
                .padding(.top, 20)

            }
            
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                Button("Register Now") {
                    createAccount.toggle()
                }
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            }
            .font(.callout)
            .vAlign(.bottom)
        }
        .vAlign(.top)
        .padding(15)
        
        //Register View VIA Sheets
        .fullScreenCover(isPresented: $createAccount){
            RegisterView()
        }
        
        //displays alert
        .alert(errorMessage, isPresented: $showError, actions: {})
    }
    
    func loginUser() {
        Task{
            do{
                try await Auth.auth().signIn(withEmail: emailID, password: password)
                print("User Found")
            }catch {
                await setError(error)
            }
        }
    }
    
    func resetPassword() {
        Task{
            do{
                try await Auth.auth().sendPasswordReset(withEmail: emailID)
                print("Link Sent")
            }catch {
                await setError(error)
            }
        }
    }
    
    func setError(_ error: Error) async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}


struct RegisterView: View {
    @State var emailID: String = ""
    @State var phoneID: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    @State var game: String = ""
    @State var gamerTag: String = ""
    @State var userProfilePicData: Data?
    
    // View Properties
    @Environment(\.dismiss) var dismiss
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Register Account")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("Welcome to Bored!")
                .font(.title3)
                .hAlign(.leading)
            
            // helper function that fits all iphone sizes
            ViewThatFits{
                ScrollView(.vertical, showsIndicators: false) {
                    HelperView()
                }
            }
            
            // Go back to sign in
            HStack{
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                Button("Login") {
                    dismiss()
                }
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            }
            .font(.callout)
            .vAlign(.bottom)
        }
        .vAlign(.top)
        .padding(15)
        .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
        .onChange(of: photoItem) { newValue in
            if let newValue{
                Task{
                    do{
                        guard let imageData = try await newValue.loadTransferable(type: Data.self) else {return}
                        
                        await MainActor.run(body: {
                            userProfilePicData = imageData
                        })
                    }catch{}
                }
            }
        }
        //display alert
        .alert(errorMessage, isPresented: $showError, actions:{})
    }
    
    @ViewBuilder
    func HelperView() -> some View{
        VStack(spacing: 12) {
            ZStack{
                if let userProfilePicData, let image = UIImage(data: userProfilePicData){
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .frame(width: 85, height: 85)
            .clipShape(Circle())
            .contentShape(Circle())
            .padding(.top, 10)
            .padding(.bottom, 10)
            .onTapGesture {
                showImagePicker.toggle()
            }
            
            
            
            TextField("User Name", text: $userName)
                .textContentType(.emailAddress)
                .border(1 , .orange.opacity(0.5))
            
            TextField("Email", text: $emailID)
                .textContentType(.emailAddress)
                .border(1 , .orange.opacity(0.5))
            
            TextField("Phone Number", text: $phoneID)
                .textContentType(.telephoneNumber)
                .border(1 , .orange.opacity(0.5))
            
            TextField("Game", text: $game)
                .textContentType(.telephoneNumber)
                .border(1 , .orange.opacity(0.5))
            
            TextField("Gamer Tag", text: $gamerTag)
                .textContentType(.telephoneNumber)
                .border(1 , .orange.opacity(0.5))
            
            SecureField("Password", text: $password)
                .textContentType(.emailAddress)
                .border(1 , .orange.opacity(0.5))
            
            Button (action: registerUser){
                Text("Sign me up :)")
                    .foregroundColor(.white)
                    .hAlign(.center)
                    .fillView(.black)
                    
            }
            .padding(.top, 20)

        }
    }
    
    func registerUser() {
        Task{
            do{
                //creating firebase account
                let user = try await Auth.auth().createUser(withEmail: emailID, password: password)
                //upload pro pic in firebase
                guard let userUID = Auth.auth().currentUser?.uid else{return}
                guard let imageData = userProfilePicData else {return}
                
                let storageRef = Storage.storage().reference().child("Profile_Images").child(userUID)
                let _ = try await storageRef.putDataAsync(imageData)
                
                let downloadURL = try await storageRef.downloadURL()
                
            }catch{
                await setError(error)
            }
        }
    }
    // display errors via alert
    func setError(_ error: Error) async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
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



